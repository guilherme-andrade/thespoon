require "open-uri"
require "faker"

Restaurant.destroy_all

url = "https://raw.githubusercontent.com/microsoft/Windows-appsample-lunch-scheduler/master/LunchScheduler.Repository/Data/Restaurants.json"
restaurants = JSON.parse(open(url).read)

restaurants.each do |r|
  location = Faker::Movies::LordOfTheRings.location

	restaurant = Restaurant.create(
		name: "#{Faker::Movies::LordOfTheRings.character}'s kitchen",
		address: "#{location}, Middle Earth",
    image_url: "https://source.unsplash.com/1600x900/?#{location}"
  )

  puts "Created Restaurant: #{restaurant.name}"

  rand(3..10).times do
    restaurant.reviews.create(
      content: Faker::Restaurant.review,
      rating: rand(1..5)
    )
  end
end
