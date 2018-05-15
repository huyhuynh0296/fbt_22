User.create!(email: "admin@gmail.com",
             name: "Admin",
             password: "111111",
             password_confirmation: "111111",
             role: 1)

19.times do |n|
  User.create!(email: "user#{n+1}@gmail.com",
      password: "111111",
      password_confirmation: "111111",
      name: "user#{n+1}")
end

users = User.first
10.times do |n|
  users.categories.create!(name: "Danh muc #{n+1}")
end

20.times do |n|
  Peopletour.create!(title: "#{n+1} people",
    value: n+1)
end

20.times do |n|
  now = Time.now
  oneday = 60*60*24
  Datetour.create!(starttime: (now + oneday*n).strftime("%Y/%m/%d"),
    stoptime: (now+oneday+oneday*n).strftime("%Y/%m/%d"))
end
# date.strftime('%A')
#strftime("%Y/%m/%d")
#fake tour
users = User.take(6)
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
    category_id: n+1,
    datetour_id: n+1)
  end
end

10.times do |n|
  Place.create!(name: Faker::Book.title,
    user_id: 1)
end
