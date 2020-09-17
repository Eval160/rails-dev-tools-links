# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "nokogiri"

def img_url(url)
  return if Nokogiri::HTML(open(url)).css("meta[property='og:image']").blank?
  Nokogiri::HTML(open(url)).css("meta[property='og:image']").first.attributes["content"].value
end

def attach_cloudinary_img(resource)
  img = img_url(resource.url)
  return if img.nil?

  file = URI.open(img)
  resource.photo.attach(io: file, filename: resource.title, content_type: 'image/png')
end

puts "Destroy all users"
User.destroy_all

puts "Destroy all resources"
Resource.destroy_all

puts "Destroy all categories"
Category.destroy_all

puts "Create users Riri, Fifi and Loulou"
riri = User.create! email: "riri@gmail.com", password: "azerty"
fifi = User.create! email: "fifi@gmail.com", password: "azerty"
loulou = User.create! email: "loulou@gmail.com", password: "azerty"

users = [riri, fifi, loulou]

puts "Create categories"
tuto_cat = Category.create! name: "Tutoriels/cours"

front_cat = Category.create! name: "Front-end"
html_cat = Category.create! name: "HTML/CSS"
sass_cat = Category.create! name: "SASS"
js_cat = Category.create! name: "Javascript"
webdesign_cat = Category.create! name: "Webdesign"

back_cat = Category.create! name: "Back-end"
ruby_cat = Category.create! name: "Ruby"
php_cat = Category.create! name: "PHP"
python_cat = Category.create! name: "Python"
sql_cat = Category.create! name: "SQL"

doc_cat = Category.create! name: "Documentation"



puts "Create resources and Category tags"

puts "html"
url = "https://www.htmlcsscolor.com/"
html_css_color_picker = Resource.create!(
  user: users.sample,
  title: "HTML CSS Color Picker",
  description: "Librairie de couleurs: informations, générateur de dégradés, roues chromatiques, associations possibles....",
  url: url
  )
CategoryTag.create! category: front_cat, resource: html_css_color_picker
CategoryTag.create! category: html_cat, resource: html_css_color_picker
CategoryTag.create! category: webdesign_cat, resource: html_css_color_picker

puts "js"
url = "https://www.javascriptdezero.com/"
js_de_zero = Resource.create!(
  user: users.sample,
  title: "Javascript de Zero",
  description: "Très bon site pour apprendre le js, le module débutant, pour les novices en programmation, est gratuit",
  url: url
  )
CategoryTag.create! category: js_cat, resource: js_de_zero
CategoryTag.create! category: tuto_cat, resource: js_de_zero

puts "rubdoc"
url = "https://ruby-doc.org/"
ruby_doc = Resource.create!(
  user: users.sample,
  title: "RUBYDoc",
  description: "Doc officielle de ruby",
  url: url
  )
CategoryTag.create! category: ruby_cat, resource: ruby_doc
CategoryTag.create! category: doc_cat, resource: ruby_doc
CategoryTag.create! category: back_cat, resource: ruby_doc

url = "https://guides.rubyonrails.org/"
ror_doc = Resource.create!(
  user: users.sample,
  title: "Ruby On Rails guides",
  description: "Doc de ruby on rails",
  url: url
  )
CategoryTag.create! category: ruby_cat, resource: ror_doc
CategoryTag.create! category: doc_cat, resource: ror_doc
CategoryTag.create! category: back_cat, resource: ror_doc

url = "https://undraw.co/"
undraw = Resource.create!(
  user: users.sample,
  title: "Undraw",
  description: "Illustrations open-sources en format SVG ou PNG, on peut personnaliser la couleur",
  url: url
  )
CategoryTag.create! category: front_cat, resource: undraw
CategoryTag.create! category: webdesign_cat, resource: undraw

url = "https://www.pierre-giraud.com/"
pierregiraud = Resource.create!(
  user: users.sample,
  title: "Pierre Giraud",
  description: "Site proposant des cours sur HTML/CSS, Bootstrap, JS, SASS, mais aussi PHP, MySQL, Python, git....",
  url: url
  )
CategoryTag.create! category: front_cat, resource: pierregiraud
CategoryTag.create! category: js_cat, resource: pierregiraud
CategoryTag.create! category: html_cat, resource: pierregiraud
CategoryTag.create! category: sass_cat, resource: pierregiraud
CategoryTag.create! category: php_cat, resource: pierregiraud
CategoryTag.create! category: back_cat, resource: pierregiraud
CategoryTag.create! category: tuto_cat, resource: pierregiraud
CategoryTag.create! category: python_cat, resource: pierregiraud
CategoryTag.create! category: sql_cat, resource: pierregiraud

url = "https://tympanus.net/codrops/"
codrops = Resource.create!(
  user: users.sample,
  title: "Codrops",
  description: "Inspirations, tutos, actualités en rapport avec le webdesign et de developpement front",
  url: url
  )
CategoryTag.create! category: front_cat, resource: codrops
CategoryTag.create! category: js_cat, resource: codrops
CategoryTag.create! category: html_cat, resource: codrops
CategoryTag.create! category: webdesign_cat, resource: codrops
CategoryTag.create! category: tuto_cat, resource: codrops

url = "https://devdocs.io/"
devdocs = Resource.create!(
  user: users.sample,
  title: "Devdocs.io",
  description: "Regroupe les docs de nombreux languages et frameworks",
  url: url
  )
CategoryTag.create! category: front_cat, resource: devdocs
CategoryTag.create! category: js_cat, resource: devdocs
CategoryTag.create! category: html_cat, resource: devdocs
CategoryTag.create! category: sass_cat, resource: devdocs
CategoryTag.create! category: back_cat, resource: devdocs
CategoryTag.create! category: php_cat, resource: devdocs
CategoryTag.create! category: doc_cat, resource: devdocs
CategoryTag.create! category: python_cat, resource: devdocs
CategoryTag.create! category: sql_cat, resource: devdocs
CategoryTag.create! category: ruby_cat, resource: devdocs

url = "https://developer.mozilla.org/"
mdn = Resource.create!(
  user: users.sample,
  title: "MDN web docs",
  description: "Doc html/css et js, le site propose également des tuto front. Disponible en français, la version anglaise est plus complète et plus souvent mise à jour",
  url: url
  )
CategoryTag.create! category: front_cat, resource: mdn
CategoryTag.create! category: js_cat, resource: mdn
CategoryTag.create! category: html_cat, resource: mdn
CategoryTag.create! category: doc_cat, resource: mdn
CategoryTag.create! category: tuto_cat, resource: mdn

url = "https://www.codewars.com/"
codewars = Resource.create!(
  user: users.sample,
  title: "Codewars",
  description: "Site de référence pour s'exercicer et progresser dans un language, très ludique",
  url: url
  )
CategoryTag.create! category: back_cat, resource: codewars
CategoryTag.create! category: js_cat, resource: codewars
CategoryTag.create! category: ruby_cat, resource: codewars
CategoryTag.create! category: php_cat, resource: codewars
CategoryTag.create! category: sql_cat, resource: codewars
CategoryTag.create! category: python_cat, resource: codewars

url = "https://htmlreference.io/"
htmlreference = Resource.create!(
  user: users.sample,
  title: "Html reference",
  description: "Référence tous les éléments et attributs HTML, avec pour chacun une description et des exemples",
  url: url
  )
CategoryTag.create! category: html_cat, resource: htmlreference
CategoryTag.create! category: front_cat, resource: htmlreference

url = "https://cssreference.io/"
cssreference = Resource.create!(
  user: users.sample,
  title: "CSS reference",
  description: "Comme htmlreference.io, le site propose une description et des exemples d'utilisation des propriétés css les plus courantes",
  url: url
  )
CategoryTag.create! category: html_cat, resource: cssreference
CategoryTag.create! category: front_cat, resource: cssreference

url = "https://codetogo.io/"
codetogo = Resource.create!(
  user: users.sample,
  title: "Codetogo.io",
  description: "Snippets JS et React fréquemment utilisés, prêt à l'emploi",
  url: url
  )
CategoryTag.create! category: js_cat, resource: codetogo

url = "https://locomotivemtl.github.io/locomotive-scroll/"
locomotive = Resource.create!(
  user: users.sample,
  title: "Locomotive scroll",
  description: "Librairie JS pour faire des effets de parallax et des animations au scroll",
  url: url
  )
CategoryTag.create! category: js_cat, resource: locomotive
CategoryTag.create! category: front_cat, resource: locomotive

url = "https://thisthat.dev/"
thisvsthat = Resource.create!(
  user: users.sample,
  title: "This VS that",
  description: "Le site compare et explique les différences entre certaines propriétés/fonctions/attributs... qui peuvent sembler similaires",
  url: url
  )
CategoryTag.create! category: js_cat, resource: thisvsthat
CategoryTag.create! category: front_cat, resource: thisvsthat
CategoryTag.create! category: html_cat, resource: thisvsthat

url = "https://dribbble.com/"
dribbble = Resource.create!(
  user: users.sample,
  title: "Dribbble",
  description: "Inspiration webdesign",
  url: url
  )
CategoryTag.create! category: webdesign_cat, resource: dribbble

url = "https://jsfiddle.net/"
jsfiddle = Resource.create!(
  user: users.sample,
  title: "JSFiddle",
  description: "JSFiddle est un service IDE en ligne et une communauté en ligne pour tester et présenter des extraits de code HTML, CSS et JavaScript créés par les utilisateurs et collaboratifs, appelés «fiddles». Il permet des appels AJAX simulés",
  url: url
  )
CategoryTag.create! category: front_cat, resource: jsfiddle
CategoryTag.create! category: js_cat, resource: jsfiddle
CategoryTag.create! category: html_cat, resource: jsfiddle

url = "https://exercism.io/"
exercism = Resource.create!(
  user: users.sample,
  title: "Exercism.io",
  description: "Exercism est une plate-forme de codage en ligne, open source et gratuite qui offre la pratique du code et le mentorat sur 50 langages de programmation différents.",
  url: url
  )
CategoryTag.create! category: back_cat, resource: exercism
CategoryTag.create! category: js_cat, resource: exercism
CategoryTag.create! category: ruby_cat, resource: exercism
CategoryTag.create! category: php_cat, resource: exercism
CategoryTag.create! category: sql_cat, resource: exercism
CategoryTag.create! category: python_cat, resource: exercism

url = "https://squoosh.app/"
squoosh = Resource.create!(
  user: users.sample,
  title: "Squoosh",
  description: "Squoosh est un nouveau service en ligne qui permet de compresser vos images sans perte de qualité visible, depuis votre navigateur.",
  url: url
  )
CategoryTag.create! category: front_cat, resource: squoosh

url = "https://web.dev/"
devweb = Resource.create!(
  user: users.sample,
  title: "Dev.web",
  description: "Lancer par google, dev.web est divisé en deux parties : Learn et Mesure. La première contient des tutoriels précis pour apprendre à concevoir des sites web efficaces ; la seconde est un outil d’analyse des performances pour tester son propre site internet.",
  url: url
  )
CategoryTag.create! category: front_cat, resource: devweb
CategoryTag.create! category: back_cat, resource: devweb
CategoryTag.create! category: tuto_cat, resource: devweb

url = "https://bulma.io/"
bulma = Resource.create!(
  user: users.sample,
  title: "Bulma",
  description: "Bulma est un framework CSS open-source. 100% responsive, gratuit et modulaire, on importe que ce dont on a besoin",
  url: url
  )
CategoryTag.create! category: front_cat, resource: bulma
CategoryTag.create! category: html_cat, resource: bulma

url = "https://github.com/michalsnik/aos"
aos = Resource.create!(
  user: users.sample,
  title: "AOS - Animate on scroll libray",
  description: "Librairie JS d'animations au scroll",
  url: url
  )
CategoryTag.create! category: front_cat, resource: aos
CategoryTag.create! category: js_cat, resource: aos

url = "https://www.grafikart.fr/"
grafikart = Resource.create!(
  user: users.sample,
  title: "Grafikart",
  description: "Des centaines d'heures de video pour apprendre le html, css, sass, php, ruby....",
  url: url
  )
CategoryTag.create! category: back_cat, resource: grafikart
CategoryTag.create! category: js_cat, resource: grafikart
CategoryTag.create! category: ruby_cat, resource: grafikart
CategoryTag.create! category: php_cat, resource: grafikart
CategoryTag.create! category: sql_cat, resource: grafikart
CategoryTag.create! category: python_cat, resource: grafikart
CategoryTag.create! category: tuto_cat, resource: grafikart
CategoryTag.create! category: html_cat, resource: grafikart
CategoryTag.create! category: front_cat, resource: grafikart
CategoryTag.create! category: sass_cat, resource: grafikart

puts "Finish create resources"

puts "attach cloudinary photo"
Resource.all.each do |resource|
  attach_cloudinary_img(resource)
end

puts "Finish!"
