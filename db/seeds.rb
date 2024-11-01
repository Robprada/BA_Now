# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
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

puts "Creando experiencias..."
experiences = [
  { title: "Tour por la ciudad", description: "Recorrido histórico por el centro", price: 2500, availability: 20, address: "Avenida Santa Fe 1305, Palermo" },
  { title: "Clase de cocina", description: "Aprende a cocinar platos típicos", price: 3500, availability: 15, address: "Avenida Callao 2578, Recoleta" },
  { title: "Taller de fotografía", description: "Básicos de fotografía digital", price: 4000, availability: 10, address: "Avenida Santa Maria de las Conchas 7278, Tigre" }
]

created_experiences = experiences.each_with_index.map do |exp_data, index|
  # Assign each experience to different users
  exp_data[:user] = created_users[index]
  Experience.create!(exp_data)
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

puts "Creando bookings..."
50.times do |i|
  # select a random experience
  experience = created_experiences.sample
  # select a user thats not the owner of the experience
  available_users = created_users - [experience.user]
  user = available_users.sample

  Booking.create!(
    booking_date: Date.today + rand(1..60), # Fecha aleatoria en los próximos 60 días
    hour: Time.parse(available_hours.sample),
    tickets: rand(1..5), # Entre 1 y 5 tickets
    user: user,
    experience: experience
  )
end

puts "Seeds completados!"
puts "Creados:"
puts "- #{User.count} usuarios"
puts "- #{Experience.count} experiencias"
puts "- #{Booking.count} bookings"
