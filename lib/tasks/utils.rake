namespace :utils do
  desc "Cria administradores fake"
  task generate_admins: :environment do
    puts "Cadastrando Admins..."
    10.times do 
      Admin.create!(
        email: Faker::Internet.email,
        password: '1234567890',
        password_confirmation: '1234567890'
      )
    end
      puts "Admins cadastrados com sucesso!"
  end
end
