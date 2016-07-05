# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cooking = Activity.create(title: "cooking", description: "cooking with ellis", instructor_id: 2)
cooking = Tag.create(category: "cooking")
at = ThroughAt.create(activity_id: 1, tag_id: 1)
review = Review.create(content: "I had so much fun cooking with Ellis!", activity_id: 1, rating: 5)
