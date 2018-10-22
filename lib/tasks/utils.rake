namespace :utils do
  desc "Cria administradores fake"
  task generate_admins: :environment do
    puts "Cadastrando Admins..."
    10.times do 
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: '1234567890',
        password_confirmation: '1234567890',
        role: [0,1,1].sample
      )
    end
      puts "Admins cadastrados com sucesso!"
  end

  desc "Cria anúncios fake"
  task generate_ads: :environment do 
    puts "Cadastrando anúncios..."

    100.times do 
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: Faker::Lorem.paragraph([3..5].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}")
    end

    puts "Anúncios cadastrados com sucesso!"
  end
end
