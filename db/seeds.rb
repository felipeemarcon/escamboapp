# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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