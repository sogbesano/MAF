# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(firstname: "jessie", 
	    surname: "jones", 
	    email: "jj@bing.bong", 
            email_confirmation: "jj@bing.bong",
            password: "123456",
            password_confirmation: "123456",
	    address: "london")  

Wine.create!(name: "Carl Jung",
             shortdesc: "Carl Jung Cabernet Sauvignon is a fruity and refreshing red wine with a hint of vanilla and blackcurrant",
             longdesc: "It has firm tannins and a marked acidity making it a wine best enjoyed with red meat dishes. It will pair particularly well with barbecued dishes and roast lamb. It rolls lightly on the tongue with a pleasant aftertaste.

Carl Jung wines contain around 20 calories per 100ml glass (many times less than traditional wine) and 0.2% alcohol by volume.",
             grapetype: "Merlot",
             forvegeterians: true,
             origin: "South Africa",
             bottlesize: "75cl",
             price: 5.99,
             supplier: "Carl Jung Winery",
             photo: File.new("/home/olu/pictures/wine.jpg"))
             
              
