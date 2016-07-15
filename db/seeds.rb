# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cooking = Tag.create(category: "cooking")
art = Tag.create(category: "art")
music = Tag.create(category: "music")
outdoors = Tag.create(category: "outdoors")
food = Tag.create(category: "food")

sharon = Contact.create(fullname: "Sharon Welch", email: "sharon.welch@yale.edu", current_admin: true)
ellis = Contact.create(fullname: "Ellis Burgoon Miskell", email: "ellis.burgoonmiskell@yale.edu", current_admin: true)
zoe = Contact.create(fullname: "Zoe Henry", email: "zoe.henry@yale.edu", current_admin: true)

sharon = User.create(first_name: "Sharon", last_name: "Welch", email: "sharon.welch@yale.edu", is_admin: true)
ellis = User.create(first_name: "Ellis", last_name: "Burgoon Miskell", email: "ellis.burgoonmiskell@yale.edu", is_admin: true)
zoe = User.create(first_name: "Zoe", last_name: "Henry", email: "zoe.henry@yale.edu", is_admin: true)

sharon = User.new
sharon.first_name = "Sharon"
#...
sharon.password = "changeme"
sharon.password_confirmation = "changeme"
sharon.save!
