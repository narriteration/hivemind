# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Seeding database..."

User.destroy_all
p "USER records destroyed"

User.create([
    {
      name: "Chelsea Mangold",
      email: "chelsea@gmail.com",
      phone: "14155555555",
      password_digest: "2343kl/4jdfi239423jrlkgf0$98j23rjk3",
      city: "Berkeley",
      state: "CA"
    },
    {
      name: "Gabriela Choy",
      email: "gabriela@gmail.com",
      phone: "15556565",
      password_digest: "23o843jkdS4HHHfnlkj8h3rjdVSAfovj9348njk",
      city: "San Jose",
      state: "CA"
    },
    {
      name: "Carl Champain",
      email: "carl@gmail.com",
      phone: "15558889090",
      password_digest: "09029274903EF98377yghfjdSnkdnvBkj23738",
      city: "San Francisco",
      state: "CA"
    },
    {
      name: "Jean Weatherwax",
      email: "jean@gmail.com",
      phone: "15552090999",
      password_digest: "08dsfn02ASD93r8j$hirfj92D73rg/2ihuf9B4/8vwh7",
      city: "San Francisco",
      state: "CA"
    }
])

p "GA-specific USERS created: #{User.count}"


ffaker_users_data = []
10.times do
  name = FFaker::Name.name
  phone = "+1" + FFaker::PhoneNumber.short_phone_number.to_s.delete!('-')
  ffaker_users_data << {
    name: name,
    email: "#{name}@example.com".downcase,
    phone: phone,
    password_digest: FFaker::Internet.password,
    city: FFaker::AddressUS.city,
    state: FFaker::AddressUS.state_abbr
  }
end

users = User.create(ffaker_users_data)


##############################################################

#
# Contact.destroy_all
# p "CONTACT records destroyed"
#
# Contact.create([
#   {
#     first_name: "Emily",
#     last_name: "Smizer",
#     nickname: "Smize",
#     phone: "+16176970979",
#     city: "Berkeley",
#     state: "CA",
#     user_id: 5,
#     approved: false
#   },
#   {
#     first_name: "Georgia",
#     last_name: "Faulkner",
#     nickname: "Geeg",
#     phone: "+15306133269",
#     city: "Oakland",
#     state: "CA",
#     user_id: 5,
#     approved: false
#   },
#   {
#     first_name: "Rafa",
#     last_name: "Sanchez-Cruz",
#     nickname: "Ralf",
#     phone: "+12096798407",
#     city: "Washington",
#     state: "District of Columbia",
#     user_id: 5,
#     approved: false
#   },
#   {
#     first_name: "Chloe",
#     last_name: "Wilder",
#     nickname: "Chloe",
#     phone: "+14085960370",
#     city: "Oakland",
#     state: "CA",
#     user_id: 5,
#     approved: false
#   }
# ])
#
# p "Real CONTACTS for seeded chelsea profile created: #{Contact.count}"


contact_data = []

60.times do
  contact_data = {
    name: FFaker::Name.name,
    phone: "+1" + FFaker::PhoneNumber.short_phone_number.to_s.delete!('-')
  }

contact = Contact.create(contact_data)
users.sample.contacts << contact

end

p "Created #{Contact.count} contacts"
