namespace :dev do

  desc "Setup Development"
  task setup: :environment do

    images_path = Rails.root.join('public', 'system')

    puts "Executando o setup para desenvolvimento..."
    puts "Apagando banco de dados #{%x(rake db:drop)}"
    puts "Apagando imagens de public/system #{%x(rm -rf #{images_path})}"
    puts "Criando banco de dados #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)
    puts %x(rake dev:generate_comments)
    puts "Setup executado com sucesso!"
  end

  ########################################################

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

  ########################################################

  desc "Cria membros fake"
  task generate_members: :environment do 
    puts "Cadastrando membros..."

    100.times do 
      member = Member.new(
        email: Faker::Internet.email,
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      member.build_profile_member

      member.profile_member.first_name = Faker::Name.first_name
      member.profile_member.last_name = Faker::Name.last_name

      member.save!
    end

    puts "Membros cadastrados com sucesso!"
  end

  ########################################################

  desc "Cria anúncios fake"
  task generate_ads: :environment do 
    puts "Cadastrando anúncios..."

    5.times do 
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_md: md_fake,
        description_short: Faker::Lorem.paragraph([2,3].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images_for_ads', "#{Random.rand(12)}.jpg"), 'r'))
    end

    100.times do 
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_md: md_fake,
        description_short: Faker::Lorem.paragraph([2,3].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images_for_ads', "#{Random.rand(13)}.jpg"), 'r'))
    end

    puts "Anúncios cadastrados com sucesso!"
  end

  def md_fake
    %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
  end

  ########################################################

  desc "Cria comentários fake"
  task generate_comments: :environment do 
    puts "Cadastrando comentários..."

    Ad.all.each do |ad|
      (Random.rand(3)).times do 
        Comment.create!(
          body: Faker::Lorem.paragraph([1,2,3].sample),
          member: Member.all.sample,
          ad: ad
        )
      end
    end 
    puts "Comentários cadastrados com sucesso..."
  end
end
