# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

services = ['Netflix',
            'Spotify',
            'Deezer',
            'Youtube Premium']

puts 'Cadastrando Serviços'
services.each do |service|
  Service.create!(
    title: service,
    kind: 'Video/Musica',
    description: 'Zombie ipsum reversus ab viral inferno'
  )
end
puts 'OK!!!'

puts 'Cadastrando Administradores'
Admin.create!(
  email: 'admin@email.com',
  password: '12345678',
  password_confirmation: '12345678'
)
puts 'OK!!!'

puts 'Cadastrando Counter_Cache'
CountUser.create!(
  id: 1
)
puts 'OK!!!'
