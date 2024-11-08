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
  "Taller-de-fotografia-juvenil-andanafoto_bafg96",
  "espectaculo-tango-porteno_xgyc6u",
  "pareja-bailarines-tangueros-teatro-espejo_bwgx2p",
  "compania-de-tango-porteno-buenos-aires_tcbxdx",
  "nlrk6fqskvgvvd4ovgam",
  "nfmbpdyu4stuvwzcgepz",
  "h9gj4ykq6tehxalv15cl",
  "mtpatqh64jdwx4xjtsad",
  "dcr2emtc7irqbkm4xfx4",
  "whinkttfrbpbdabykapy",
  "qxudf7uoke0j9kin1gxv",
  "dfzyhrxsg8vu6vmzux1l",
  "bzl62fepc2eh80q2en3c",
  "pqzrfyfj6cpwwigx5uwc",
  "cetb5yzdp3ixoccnen9n",
  "jo2r6osneefqbdbtqzhg",
  "b2spcvfjer2igbvyg3l7",
  "v5n3d2jnbxtlbe6lvzq9",
  "kiqth8dyjppyssgmqux2",
  "llebinsproyeblvvbac5",
  "fs4jrq022xwv8zbwhijr",
  "z0rlrjrcthhn5oj1mtr9",
  "jimggyksxqfoo4zwrwlg",
  "rzboqubxbv4ho58iw5in",
  "kt2tve4bar9njmeugk3r",
  "ccbhr5fk3avdkvt0jl8f",
  "xeg5z1gcvurbkfceyr5n",
  "yvkhcry8bzmdmpm70ib7",
  "qex7tm9p9nazj3poqdek",
  "s0jbajqtiwehsdn7reyl",
  "chavf4tninnxnhsud45u"
]

puts "Creando experiencias..."
experiences = [
  { title: "Tour por la ciudad", description: "Recorrido histórico por el centro", price: 2500, availability: 20, address: "Avenida Santa Fe 1305, Palermo" },
  { title: "Clase de Cocina", description: "Aprende a cocinar platos típicos", price: 3500, availability: 15, address: "Avenida Callao 2578, Recoleta" },
  { title: "Taller de Fotografía", description: "Básicos de fotografía digital", price: 4000, availability: 10, address: "Av. Jorge Newbery 3489, Chacarita" },
  { title: "Teatro Tango Porteño", description: "Disfruta de un buen espectáculo tanguero", price: 55000, availability: 40, address: "Cerrito 570, San Nicolás" },
  { title: "Centro Histórico", description: "La mejor manera de recorrer el centro histórico", price: 35000, availability: 20, address: "Av. Hipólito Yrigoyen 500, Monserrat" },
  { title: "Asado Argentino", description: "Típico asado argentino en Palermo", price: 120000, availability: 10, address: "Armenia 1680, Palermo" },
  { title: "Recorriendo Recoleta", description: "Visita guiada por La Recoleta", price: 60000, availability: 50, address: "Vicente López 2050, Recoleta" },
  { title: "Ateneo Grand Splendid", description: "La libreria más bonitas de la capital", price: 20000, availability: 20, address: "Av. Sta. Fe 1860, Recoleta" },
  { title: "Jazz en Recoleta", description: "Recoleta es magica con Jazz", price: 20000, availability: 20, address: "Av. Sta. Fe 1860, Recoleta" },
  { title: "Partido de polo", description: "Famoso Abierto de Palermo", price: 150000, availability: 25, address: "Av. del Libertador 4096, Palermo" },
  { title: "Casa del Diego", description: "La Casa de D10S, Historia y fútbol", price: 60000, availability: 10, address: "Lascano 2257, Villa del Parque" },
  { title: "Taller de Mate", description: "¿Cómo se prepara la famosa infusión?", price: 10000, availability: 10, address: "Ayacucho 1538, Recoleta" },
  { title: "Autobús Turístico", description: "Autobús turístico Gray Line", price: 45000, availability: 30, address: "Av. Sta. Fe 3253, Palermo" },
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
