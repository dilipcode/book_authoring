# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  Book.find_or_create_by(title: "Emotional strength") do |book|
    book.description= "Learn to stay strong in face of adversity"
  end
  Book.find_or_create_by(title: " Decision making") do |book|
    book.description= "Taking decisions without fear or anger"
  end
  Book.find_or_create_by(title: " Influenced?") do |book|
  book.description="Stop comparing youself with others and start measuring yourself"
  end

  demo_book = Book.find_or_create_by(title: "Demo book")
  (1..10).each do |i|
    chapter = demo_book.chapters.find_or_create_by(title: "Chapter #{i}")
      (1..5).each do |j|
        section = chapter.sections.find_or_create_by(title: "Section #{i}.#{j}")
        section.content = "Lorem ipsum fhbjggddffyfyhgkjddg cgchgcghghxgfc xfdthdtchgcaaaawzszxcj;k jbjkbjkbj"
        section.save!
      end
  end
end
