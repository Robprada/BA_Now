require 'open-uri'

puts "Limpiando base de datos..."
Booking.destroy_all
Experience.destroy_all
User.destroy_all

# Creando usuarios
puts "Creando usuarios..."
users = [
  { username: "valentin", email: "valentin@ejemplo.com", password: "123456", municipality: "Palermo" },
  { username: "roberto", email: "roberto@ejemplo.com", password: "123456", municipality: "Recoleta" },
  { username: "omar", email: "omar@ejemplo.com", password: "123456", municipality: "Tigre" }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

cloudinary_photo_ids = [
  "uiNx0RtPV_720x0__1_aha0ds",
  "la-bombonera-cumple-80-KMBRBC324FAK5O4OH3TT7WPPII_ismc5b",
  "b5a7d3ad29b94ba4a364b686a5e8624d_yltsnz",
  "clases_ndw1i1",
  "clases-cocina-precios_kslucd",
  "9184-yfbtoh_pjmxuo",
  "preparaotoria-privada_qeyffv",
  "Imparte-un-taller-de-fotografia-infantil-y-juvenil_pjezaz",
  "Taller-de-fotografia-juvenil-andanafoto_bafg96"
]

puts "Creando experiencias..."
experiences = [
  { title: "Tour por la ciudad", description: "Recorrido histórico por el centro", price: 2500, availability: 20, address: "Avenida Santa Fe 1305, Palermo" },
  { title: "Clase de cocina", description: "Aprende a cocinar platos típicos", price: 3500, availability: 15, address: "Avenida Callao 2578, Recoleta" },
  { title: "Taller de fotografía", description: "Básicos de fotografía digital", price: 4000, availability: 10, address: "Avenida Santa Maria de las Conchas 7278, Tigre" }
]

created_experiences = experiences.each_with_index.map do |exp_data, index|
  # Assign each experience to different users
  exp_data[:user_id] = created_users[index % created_users.size].id
  experience = Experience.create!(exp_data)

  # Purge existing photos
  experience.photos.purge

  # Attach 3 photos to each experience
  start_index = index * 3
  end_index = start_index + 2
  (start_index..end_index).each do |photo_index|
    experience.photos.attach(io: URI.open("https://res.cloudinary.com/diugmcj6k/image/upload/#{cloudinary_photo_ids[photo_index]}.jpg"), filename: "#{SecureRandom.hex}.jpg")
  end

  experience
end

available_hours = [
  "09:00",
  "10:00",
  "11:00",
  "14:00",
  "15:00",
  "16:00",
  "17:00",
  "18:00"
]

# puts "Creando bookings..."
# 50.times do |i|
#   # select a random experience
#   experience = created_experiences.sample
#   # select a user that's not the owner of the experience
#   available_users = created_users - [User.find(experience.user_id)]
#   user = available_users.sample

#   Booking.create!(
#     booking_date: Date.today + rand(1..60), # Fecha aleatoria en los próximos 60 días
#     hour: Time.parse(available_hours.sample),
#     tickets: rand(1..5), # Entre 1 y 5 tickets
#     user: user,
#     experience: experience
#   )
# end

puts "Seeds completados!"
puts "Creados:"
puts "- #{User.count} usuarios"
puts "- #{Experience.count} experiencias"
puts "- #{Booking.count} bookings"
