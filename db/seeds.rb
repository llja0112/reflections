# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin_email = 'llja0112@gmail.com'
admin = User.find_by(email: admin_email)
if !admin
  admin = User.new({
    email: admin_email,
    first_name: 'Lianjie Anthony'
    last_name: 'Li',
    password: 'password',
    password_confirmation: 'password'
  })
  admin.skip_confirmation!
  admin.save!
end
