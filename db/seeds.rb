# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = {

    admin: {

        name: 'admin',
        email: 'admin@gmail.com',
        password: 'adminpass',
        password_confirmation: 'adminpass',
        admin: true
    },

    administrator: {

        name: 'administrator',
        email: 'administrator@gmail.com',
        password: 'administrator',
        password_confirmation: 'administrator',
        admin: true
    }
}

users.each do |user, data|

  user = User.new(data)

  unless User.where(email: user.email).exists?
    user.save!
  end
end