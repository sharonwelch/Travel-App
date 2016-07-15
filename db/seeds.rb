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

sharon = User.new
sharon.first_name = "Sharon"
sharon.last_name = "Welch"
sharon.email = "sharon.welch@yale.edu"
sharon.is_admin = true
sharon.password = "changeme"
sharon.password_confirmation = "changeme"
sharon.save!

ellis = User.new
ellis.first_name = "Ellis"
ellis.last_name = "Burgoon Miskell"
ellis.email = "ellis.burgoonmiskell@yale.edu"
ellis.is_admin = true
ellis.password = "changeme"
ellis.password_confirmation = "changeme"
ellis.save!

zoe = User.new
zoe.first_name = "Zoe"
zoe.last_name = "Henry"
zoe.email = "zoe.henry@yale.edu"
zoe.is_admin = true
zoe.password = "changeme"
zoe.password_confirmation = "changeme"
zoe.save!
