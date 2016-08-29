@num_companies = 200
@num_sources = 10
@num_products = 2000
@num_model_numbers = 8000
@num_agents = 100
@num_portals = 10
@num_facilities = 10

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

@num_model_numbers.times do |i|
	ModelNumber.create!(
		model: "#{Faker::Internet.password}".upcase,
		description: Faker::Lorem.sentence,
		product_id: rand(1..@num_products)
	)
end

@num_agents.times do |i|
	Agent.create!(
		skill: Faker::Superhero.power,
		team: "#{Faker::Superhero.name} #{Faker::Company.suffix}",
		support_center: "#{Faker::Address.street_name} Support Center",
		region: Faker::Address.time_zone,
		workgroup: "XGPS-#{Faker::Space.planet} #{Faker::Space.moon}".upcase,
		phone: Faker::PhoneNumber.phone_number
	)
end

@num_portals.times do |i|
	Portal.create!(
		name: "Motorola Solutions #{Faker::App.name}",
		website_url: Faker::Internet.url("motorolasolutions.com"),
		description: Faker::Company.catch_phrase
	)
end

@num_facilities.times do |i|
	Facility.create!(
		name: "Motorola Solution #{Faker::Company.name} Facility",
		phone: Faker::PhoneNumber.phone_number,
		address1: Faker::Address.street_address,
		address2: "Suite #{Faker::Address.building_number}",
		city: Faker::Address.city,
		state: Faker::Address.state,
		zip_code: Faker::Address.zip_code,
		country: Faker::Address.country
	)
end

Request.create!([
	{ request: "Presale" },
	{ request: "Order" },
	{ request: "Return" },
	{ request: "Replacement" },
	{ request: "Repair" },
	{ request: "Technical Support" }
])

@num_products.times do |i|
	rand(0..3).times do |j|
		AgentAssignment.create!(
			condition: "If #{Faker::Lorem.sentence}.downcase",
			request_id: rand(1..Request.count),
			product_id: rand(1..@num_products),
			agent_id: rand(1..@num_agents)
		)
	end
end

@num_products.times do |i|
	rand(0..3).times do |j|
		PortalAssignment.create!(
			condition: "If #{Faker::Lorem.sentence}.downcase",
			request_id: rand(1..Request.count),
			product_id: rand(1..@num_products),
			portal_id: rand(1..@num_portals)
		)
	end
end

@num_products.times do |i|
	rand(0..3).times do |j|
		FacilityAssignment.create!(
			condition: "If #{Faker::Lorem.sentence}.downcase",
			request_id: rand(1..Request.count),
			product_id: rand(1..@num_products),
			facility_id: rand(1..@num_facilities)
		)
	end
end