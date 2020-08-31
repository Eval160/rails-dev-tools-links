# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all users"
User.destroy_all

puts "Destroy all resources"
Resource.destroy_all

puts "Destroy all categories"
Category.destroy_all

puts "Create users Riri, Fifi and Loulou"
User.create! email: "riri@gmail.com", password: "azerty"
User.create! email: "fifi@gmail.com", password: "azerty"
User.create! email: "loulou@gmail.com", password: "azerty"

puts "Create categories"
ruby_category = Category.create! name: "Ruby"
ror_category = Category.create! name: "Ruby On Rails"
js_category = Category.create! name: "Javascript"
html_category = Category.create! name: "HTML/CSS"
sass_category = Category.create! name: "SASS"
php_category = Category.create! name: "PHP"
front_category = Category.create! name: "Front-end"


puts "Create resources"
resource_html = Resource.create! title: "HTML CSS Color Picker", description: "Super site pour trouver des couleurs", url: "https://www.htmlcsscolor.com/"
resource_js = Resource.create! title: "Javascript de Zero", description: "Cours pour apprendre le js", url: "https://www.javascriptdezero.com/"
resource_ruby = Resource.create! title: "RUBYDoc", description: "Doc officielle de ruby", url: "https://ruby-doc.org/"
resource_ror = Resource.create! title: "Ruby On Rails guides", description: "Doc ruby on rails", url: "https://guides.rubyonrails.org/"

puts "Add CategoryTags"
CategoryTag.create! category: html_category, resource: resource_html
CategoryTag.create! category: js_category, resource: resource_js
CategoryTag.create! category: ruby_category, resource: resource_ruby
CategoryTag.create! category: ror_category, resource: resource_ror


puts "Finish!"
