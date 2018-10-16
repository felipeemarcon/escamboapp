# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando Admin..."
Admin.first_or_create(
  email: 'admin@admin.com',
  password: '1234567890',
  password_confirmation: '1234567890'
)
puts "Admin cadastrado com sucesso!"

puts "Cadastrando categorias..."
categories = [ "Animais e acessórios",
               "Esportes",
               "Para a sua casa",
               "Eletrônicos e Celulares",
               "Música e Hobbies",
               "Bebês e Crianças",
               "Moda e Beleza",
               "Veículos e Barcos",
               "Imóveis",
               "Empregos e Negócios"]

categories.each do |c|
  Category.find_or_create_by(description: c)
end
puts "Categorias cadastradas com sucesso!"