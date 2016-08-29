# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
    c=Company.create(:name=>Faker::Company.name)
    c.create_address(:street=>Faker::Address.street_name,:city=>Faker::Address.city,:pincode=>Faker::Address.postcode)

    5.times do
      c.employees.create(:name=>Faker::Name.name,:email=>Faker::Internet.email,:phone=>rand(1000000000..9999999999),:salary=>rand(1000..100000),:designation=>Faker::Company.profession)
    end
end

Employee.all.each do |t|
  t.create_address(:street=>Faker::Address.street_name,:city=>Faker::Address.city,:pincode=>Faker::Address.postcode)
end
