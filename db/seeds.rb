

20.times { User.create! name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word }

10.times {Url.create!(name: Faker::Internet.domain_word,long: Faker::Internet.url )}
