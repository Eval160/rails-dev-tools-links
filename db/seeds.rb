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

html_css_color_picker = Resource.create! title: "HTML CSS Color Picker", description: "Librairie de couleurs: informations, générateur de dégradés, roues chromatiques, associations possibles....", url: "https://www.htmlcsscolor.com/"
CategoryTag.create! category: html_cat, resource: html_css_color_picker
CategoryTag.create! category: front_cat, resource: html_css_color_picker
CategoryTag.create! category: webdesign_cat, resource: html_css_color_picker

js_de_zero = Resource.create! title: "Javascript de Zero", description: "Très bon site pour apprendre le js, le module débutant, pour les novices en programmation, est gratuit", url: "https://www.javascriptdezero.com/"
CategoryTag.create! category: js_cat, resource: js_de_zero
CategoryTag.create! category: tuto_cat, resource: js_de_zero

ruby_doc = Resource.create! title: "RUBYDoc", description: "Doc officielle de ruby", url: "https://ruby-doc.org/"
CategoryTag.create! category: ruby_cat, resource: ruby_doc
CategoryTag.create! category: doc_cat, resource: ruby_doc
CategoryTag.create! category: back_cat, resource: ruby_doc

ror_doc = Resource.create! title: "Ruby On Rails guides", description: "Doc de ruby on rails", url: "https://guides.rubyonrails.org/"
CategoryTag.create! category: ruby_cat, resource: ror_doc
CategoryTag.create! category: doc_cat, resource: ror_doc
CategoryTag.create! category: back_cat, resource: ror_doc

undraw = Resource.create! title: "Undraw", description: "Illustrations open-sources en format SVG ou PNG, on peut personnaliser la couleur", url: "https://undraw.co/"
CategoryTag.create! category: front_cat, resource: undraw
CategoryTag.create! category: webdesign_cat, resource: undraw

pierregiraud = Resource.create! title: "Pierre Giraud", description: "Site proposant des cours sur HTML/CSS, Bootstrap, JS, SASS, mais aussi PHP, MySQL, Python, git....", url: "https://www.pierre-giraud.com/"
CategoryTag.create! category: front_cat, resource: pierregiraud
CategoryTag.create! category: js_cat, resource: pierregiraud
CategoryTag.create! category: html_cat, resource: pierregiraud
CategoryTag.create! category: sass_cat, resource: pierregiraud
CategoryTag.create! category: php_cat, resource: pierregiraud
CategoryTag.create! category: back_cat, resource: pierregiraud
CategoryTag.create! category: tuto_cat, resource: pierregiraud
CategoryTag.create! category: python_cat, resource: pierregiraud
CategoryTag.create! category: sql_cat, resource: pierregiraud

codrops = Resource.create! title: "Codrops", description: "Inspirations, tutos, actualités en rapport avec le webdesign et de developpement front", url: "https://tympanus.net/codrops/"
CategoryTag.create! category: front_cat, resource: codrops
CategoryTag.create! category: js_cat, resource: codrops
CategoryTag.create! category: html_cat, resource: codrops
CategoryTag.create! category: webdesign_cat, resource: codrops
CategoryTag.create! category: tuto_cat, resource: codrops

devdocs = Resource.create! title: "Devdocs.io", description: "Regroupe les docs de nombreux languages et frameworks", url: "https://devdocs.io/"
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

mdn = Resource.create! title: "MDN web docs", description: "Doc html/css et js, le site propose également des tuto front. Disponible en français, la version anglaise est plus complète et plus souvent mise à jour", url: "https://developer.mozilla.org/"
CategoryTag.create! category: front_cat, resource: mdn
CategoryTag.create! category: js_cat, resource: mdn
CategoryTag.create! category: html_cat, resource: mdn
CategoryTag.create! category: doc_cat, resource: mdn
CategoryTag.create! category: tuto_cat, resource: mdn

codewars = Resource.create! title: "Codewars", description: "Site de référence pour s'exercicer et progresser dans un language, très ludique", url: "https://www.codewars.com/"
CategoryTag.create! category: back_cat, resource: codewars
CategoryTag.create! category: js_cat, resource: codewars
CategoryTag.create! category: ruby_cat, resource: codewars
CategoryTag.create! category: php_cat, resource: codewars
CategoryTag.create! category: sql_cat, resource: codewars
CategoryTag.create! category: python_cat, resource: codewars

htmlreference = Resource.create! title: "Html reference", description: "Référence tous les éléments et attributs HTML, avec pour chacun une description et des exemples", url: "https://htmlreference.io/"
CategoryTag.create! category: html_cat, resource: htmlreference
CategoryTag.create! category: front_cat, resource: htmlreference

cssreference = Resource.create! title: "CSS reference", description: "Comme htmlreference.io, le site propose une description et des exemples d'utilisation des propriétés css les plus courantes", url: "https://cssreference.io/"
CategoryTag.create! category: html_cat, resource: cssreference
CategoryTag.create! category: front_cat, resource: cssreference

codetogo = Resource.create! title: "Codetogo.io", description: "Snippets JS et React fréquemment utilisés, prêt à l'emploi", url: "https://codetogo.io/"
CategoryTag.create! category: js_cat, resource: codetogo

locomotive = Resource.create! title: "Locomotive scroll", description: "Librairie JS pour faire des effets de parallax et des animations au scroll", url: "https://locomotivemtl.github.io/locomotive-scroll/"
CategoryTag.create! category: js_cat, resource: locomotive
CategoryTag.create! category: front_cat, resource: locomotive

thisvsthat = Resource.create! title: "This VS that", description: "Le site compare et explique les diffèrences entre certaines propriétés/fonctions/attributs... qui peuvent sembler similaires", url: "https://thisthat.dev/"
CategoryTag.create! category: js_cat, resource: thisvsthat
CategoryTag.create! category: front_cat, resource: thisvsthat
CategoryTag.create! category: html_cat, resource: thisvsthat

dribbble = Resource.create! title: "Dribbble", description: "Inspiration webdesign", url: "https://dribbble.com/"
CategoryTag.create! category: webdesign_cat, resource: dribbble

jsfiddle = Resource.create! title: "JSFiddle", description: "JSFiddle est un service IDE en ligne et une communauté en ligne pour tester et présenter des extraits de code HTML, CSS et JavaScript créés par les utilisateurs et collaboratifs, appelés «fiddles». Il permet des appels AJAX simulés", url: "https://jsfiddle.net/"
CategoryTag.create! category: front_cat, resource: jsfiddle
CategoryTag.create! category: js_cat, resource: jsfiddle
CategoryTag.create! category: html_cat, resource: jsfiddle

exercism = Resource.create! title: "Exercism.io", description: "Exercism est une plate-forme de codage en ligne, open source et gratuite qui offre la pratique du code et le mentorat sur 50 langages de programmation différents.", url: "https://exercism.io/"
CategoryTag.create! category: back_cat, resource: exercism
CategoryTag.create! category: js_cat, resource: exercism
CategoryTag.create! category: ruby_cat, resource: exercism
CategoryTag.create! category: php_cat, resource: exercism
CategoryTag.create! category: sql_cat, resource: exercism
CategoryTag.create! category: python_cat, resource: exercism

squoosh = Resource.create! title: "Squoosh", description: "Squoosh est un nouveau service en ligne qui permet de compresser vos images sans perte de qualité visible, depuis votre navigateur.", url: "https://squoosh.app/"
CategoryTag.create! category: front_cat, resource: squoosh

devweb = Resource.create! title: "Dev.web", description: "Lancer par google, dev.web est divisé en deux parties : Learn et Mesure. La première contient des tutoriels précis pour apprendre à concevoir des sites web efficaces ; la seconde est un outil d’analyse des performances pour tester son propre site internet.", url: "https://web.dev/"
CategoryTag.create! category: front_cat, resource: devweb
CategoryTag.create! category: back_cat, resource: devweb
CategoryTag.create! category: tuto_cat, resource: devweb

bulma = Resource.create! title: "Bulma", description: "Bulma est un framework CSS open-source. 100% responsive, gratuit et modulaire, on importe que ce dont on a besoin", url: "https://bulma.io/"
CategoryTag.create! category: front_cat, resource: bulma
CategoryTag.create! category: html_cat, resource: bulma

aos = Resource.create! title: "AOS - Animate on scroll libray", description: "Librairie JS d'animations au scroll", url: "https://github.com/michalsnik/aos"
CategoryTag.create! category: front_cat, resource: aos
CategoryTag.create! category: js_cat, resource: aos

puts "Finish!"
