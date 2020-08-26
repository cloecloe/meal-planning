# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

Calendar.destroy_all
User.destroy_all
Recipe.destroy_all

puts "starting seed"

calendar = Calendar.create!

default_user = User.create!({
  first_name: "Micha",
  last_name: "Smith",
  email: "micha@email.com",
  password: "123456",
  calendar_id: 1
})

second_user = User.create!({
  first_name: "Boran",
  last_name: "Smith",
  email: "boran@email.com",
  password: "123456",
  calendar_id: 1
})

# ingredient = 'cheese'

def create_recipe(ingredient)
  url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  # results = []
  html_doc.search('.standard-card-new').first(5).each do |element|
    url = element.search('.standard-card-new__thumbnail a')
    query = url.attribute('href').value

    recipe_url = "https://www.bbcgoodfood.com#{query}"

    recipe_file = open(recipe_url).read
    recipe_doc = Nokogiri::HTML(recipe_file)

    # html_doc.search('.recipe-template')
    name = recipe_doc.search('h1').text.strip

    ingredients = recipe_doc.search('.recipe-template__ingredients ul li').map do |ingredient|
      ingredient.text
    end
    instructions = recipe_doc.search('.recipe-template__method-steps ul li').map do |instruction|
      instruction.text
    end
    prep_time = recipe_doc.search('.body-copy-small span time').first.text.strip
    servings = recipe_doc.search('.icon-with-text__children')[2].text.strip
    photo_url =recipe_doc.search('.image__container picture img')[2]
    photo = photo_url.attribute('src').value
    difficulty = recipe_doc.search('.icon-with-text__children')[1].text.strip

    recipe = Recipe.create!({
      title: name,
      ingredients: ingredients,
      instructions: instructions,
      preptime: prep_time,
      serving: servings,
      difficulty: difficulty,
      user_id: 1
    })
    recipe.photo.attach(io: URI.open(photo), filename: 'recipe.jpg', content_type: 'image/jpg')
  end
end

create_recipe("carrot")
create_recipe("chocolate")
create_recipe("cheese")
create_recipe("peach")
create_recipe("pasta")

puts "ending seed"
