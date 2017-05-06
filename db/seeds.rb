# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
p "All user records destroyed"
Contact.destroy_all
p "All contact records of users destroyed"

User.create([
    {
      name: "Chelsea Mangold",
      email: "chelsea@gmail.com.",
      phone: "14155555555",
      password_digest: "2343kl/4jdfi239423jrlkgf0$98j23rjk3",
      city: "Berkeley",
      state: "CA"
    },
    {
      name: "Sally Wilder",
      email: "sally@gmail.com.",
      phone: "14156665555",
      password_digest: "23o843jkdS4HHHfnlkj8h3rjdVSAfovj9348njk",
      city: "Palo Alto",
      state: "CA"
    },
    {
      name: "Rafa Sanchez-Cruz",
      email: "rafa@gmail.com.",
      phone: "16176665555",
      password_digest: "98yfhwdjkf/lmiQBFo3i27rgbfSjkdslmfop",
      city: "Washington",
      state: "District of Columbia"
    },
    {
      name: "Shoog Queutie",
      email: "shoog@gmail.com.",
      phone: "15558889090",
      password_digest: "09029274903EF98377yghfjdSnkdnvBkj23738",
      city: "Tallahassee",
      state: "FL"
    },
    {
      name: "Omar Gadools",
      email: "omar@gmail.com.",
      phone: "16793434",
      password_digest: "08dsfn02ASD93r8j$hirfj92D73rg/2ihuf9B4/8vwh7",
      city: "Oakland",
      state: "CA"
    }
])

p "Users created: ", User.count
