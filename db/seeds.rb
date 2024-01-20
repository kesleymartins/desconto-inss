# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  salary = Faker::Number.between(from: 600.00, to: 7_000.00)
  discount = ProponentService.calculate_discount(salary:)

  proponent = Proponent.create!({
    name: Faker::Name.name,
    cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 99),
    salary: salary,
    discount: discount
  })

  proponent.create_address!({
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    district: Faker::Games::WorldOfWarcraft.hero,
    zip_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    state: Faker::Address.state,
  })

  3.times do
    PhoneNumber.create!({
      number: Faker::PhoneNumber.cell_phone,
      proponent: proponent
    })
  end
end
