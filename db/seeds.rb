User.create!(name:  "Admin",
             email: "admin@gmail.com",
             password: "111111",
             password_confirmation: "111111",
             role: 1)

Category.create!(name:  "Tour In Country",
             description: "Tour trong nuoc",
             user_id: 1)
Category.create!(name:  "Tour International",
             description: "Tour nuoc ngoai",
             user_id: 1)

users = User.first
10.times do |n|
  users.categories.create!(name: Faker::Book.genre)
end

20.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@gmail.com"
  password = "222222"
  User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             role: 0)
end

#fake tour
users = User.order(:created_at).take(6)
10.times do |n|
  users.each do |user|
    name_tour = Faker::Book.title
    description = name_tour
    price_tour = Faker::Number.number(5)
    user.tours.create!(
    name: name_tour,
    image: "img.jpg",
    clock: "2,5 day",
    description: description,
    price: price_tour,
    slot: 20+1,
    place_id: n+1,
    image_id: n+1,
    category_id: n+1)
  end
end

Place.create!(name: "Da nang", user_id: 1)
Place.create!(name: "Ha noi", user_id: 1)
Place.create!(name: "Tp Ho chi minh", user_id: 1)
