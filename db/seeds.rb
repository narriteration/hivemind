p "Seeding database..."

User.destroy_all

ffaker_users_data = []
10.times do
  name = FFaker::Name.name
  phone = "+1" + FFaker::PhoneNumber.short_phone_number.to_s.delete!('-')
  ffaker_users_data << {
    name: name,
    email: name.delete(' ') + "@example.com".downcase,
    phone: phone,
    password_digest: FFaker::Internet.password,
    city: FFaker::AddressUS.city,
    state: FFaker::AddressUS.state_abbr
  }
end

users = User.create(ffaker_users_data)

####################################################

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
