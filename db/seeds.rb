User.create!(email: "admin@gmail.com",
             name: "Admin",
             password: "111111",
             password_confirmation: "111111",
             role: 1)

Category.create!(name: "delete", user_id: 1)

19.times do |n|
  User.create!(email: "user#{n+1}@gmail.com",
      password: "111111",
      password_confirmation: "111111",
      name: "user#{n+1}")
end

users = User.first
20.times do |n|
  3.times do|m|
    users.categories.create!(name: "Danh muc #{n+1}",
      user_id: 1,
      parent: n+1)
  end
end

20.times do |n|
  Peopletour.create!(title: "#{n+1} people",
    value: n+1)
end

30.times do |n|
  4.times do |m|
    now = Time.now
    oneday = 60*60*24
    Datetour.create!(
      starttime: (now + oneday * n).strftime("%Y/%m/%d"),
      stoptime: (now + oneday + oneday * n).strftime("%Y/%m/%d"),
      tour_id: n+1)
  end
end

user = User.first
20.times do |n|
  name_tour = Faker::Book.title
  description = name_tour
  price_tour = 10.4
  user.tours.create!(
  name: name_tour,
  image: "img.jpg",
  clock: "2,5 day",
  description: description,
  price: price_tour+n+0.1,
  slot: 20+1,
  image_id: n+1,
  category_id: n+1)
end
# date.strftime('%A')
#strftime("%Y/%m/%d")
#fake tour

10.times do |n|
  Place.create!(name: Faker::Book.title)
end
