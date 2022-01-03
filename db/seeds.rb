# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
site  = Site.create(name:"Covid", auto: :inactive)
puts "Success: Site Created"
category = Category.create(name:'Dan', site_id: site.id)
puts "Success: Category Created"
Metric.create(category_id: category.id, value: 56)
puts "Success: Metrics data loaded"