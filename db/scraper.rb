require 'open-uri'
require 'nokogiri'


ingredient = 'cheese'
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# results = []
html_doc.search('.standard-card-new').first(10).each do |element|
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
end
