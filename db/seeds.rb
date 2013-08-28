

20.times { User.create! name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word }
