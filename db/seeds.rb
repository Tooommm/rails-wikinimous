# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "#{Article.all.count} to delete"
Article.delete_all
p "done"

p "crerating 10 articles"
10.times do
  article = Article.new
  article.title = Faker::Movie.title
  article.content = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
  article.save
  p "article #{article.title} created"
end
