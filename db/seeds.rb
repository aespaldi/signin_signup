

10.times do 
  Url.create!(name: Faker::Internet.user_name,long: Faker::Internet.url )
end
