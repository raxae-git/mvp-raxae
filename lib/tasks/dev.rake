namespace :dev do
  desc 'Configura o ambiente de desenvolvimento e teste'
  task setup: :environment do
    show_spinner('Apagando o BD') { `rails db:drop` }
    show_spinner('Criando o BD') { `rails db:create` }
    show_spinner('Migrando o BD') { `rails db:migrate` }
    show_spinner('Populando o BD') { `rails db:seed` }
    show_spinner('Adcionando usuarios faker') { `rails dev:faker_users` }
    show_spinner('Adcionando grupos faker') { `rails dev:faker_groups` }
  end

  desc 'Adciona usuarios faker'
  task faker_users: :environment do
    200.times do
      BetaUser.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        messaging_service: %w[Whatsapp Telegram].sample,
        service_of_interest: Service.all.sample.title
      )
    end
  end

  desc 'Adciona grupos faker'
  task faker_groups: :environment do
    20.times do
      Group.create!(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        service_id: Service.all.sample.id,
        value: [10, 20, 30, 40].sample
      )
    end
  end

  private

  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success('(Feito!)')
  end
end
