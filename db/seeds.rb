# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'httparty'
require 'json'
wine_services = Array[
  'http://localhost:5000/supplier.redberry/api/wines',
  'http://localhost:5001/supplier.blueberry/api/wines'
]

wine_services.each { |url| 
  response = HTTParty.get(url);
  wines_data = JSON.parse(response.body)
  i = 0
  wines_data.each do |wine_data|
    #wine = Wine.create!(wine_data[1])
    wine_data[1].length.times do
    puts "BULLSHIT " + wine_data[1][i].to_s
    Wine.create!(name: wine_data[1][i]["name"],
                 shortdesc: wine_data[1][i]["shortdesc"],
                 longdesc: wine_data[1][i]["longdesc"],
                 grapetype: wine_data[1][i]["grapetype"],
                 forvegeterians: wine_data[1][i]["forvegeterians"],
                 origin: wine_data[1][i]["origin"],
                 bottlesize: wine_data[1][i]["bottlesize"],
                 price: wine_data[1][i]["price"],
                 supplier: wine_data[1][i]["supplier"],
                 photo: File.new(wine_data[1][i]["photo"]))
    i = i + 1
    end
  end 
}

User.create!(firstname: "jessie", 
	    surname: "jones", 
	    email: "jj@bing.bong", 
            email_confirmation: "jj@bing.bong",
            password: "123456",
            password_confirmation: "123456",
	    address: "london")  

              
