# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |n|
  user = User.create!(
    email: "test#{n+1}@test.com",
    password: "123456",
    name: "ユーザー#{n+1}",
  )
  user.profile_image.attach(io: File.open(Rails.root.join("db/dummy_img/#{n+1}.jpg")),
                            filename: "test#{n+1}.jpg")

  book = user.books.create!(
    title: "タイトル#{n+1}",
    body: "テキスト#{n+1}"
  )
  book.book_image.attach(io: File.open(Rails.root.join("db/book_image/#{n+1}.png")),
                         filename: "test#{n+1}.png")
end
