@num_companies = 200
@num_sources = 10
@num_products = 2000

@num_companies.times do |i|
	Company.create!(
		name: "#{Faker::Company.name}#{i}",
		website_url: Faker::Internet.url
	)
end

@num_sources.times do |i|
	Source.create!(
		location: "#{Faker::Address.city}#{i}"
	)
end

@num_products.times do |i|
	Product.create!(
		name: "#{Faker::Commerce.product_name}#{i}",
		description: Faker::Lorem.sentence,
		image_url: Faker::Avatar.image,
		company_id: rand(1..@num_companies),
		source_id: rand(1..@num_sources)
	)
end