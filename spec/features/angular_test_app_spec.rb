require 'rails_helper'

feature "angular test" do
	
	# Use let to avoid duplicating user's email / password
	let(:email) { "test@motorolasolutions.com" }
	let(:password) { "password" }

	# Create and login user before tests are run
	before do
		User.create!(email: email,
					 password: password,
					 password_confirmation: password)
	end

	scenario "Our Angular Test App is Working" do
		visit "/angular_test"

		# Login
		fill_in "Email", with: "test@motorolasolutions.com"
		fill_in "Password", with: "password"
		click_button "Log in"

		# Check that we go to the right page
		expect(page).to have_content("Name")

		# Test the page
		fill_in "name", with: "Bob"
		within "header h1" do
			expect(page).to have_content("Hello, Bob")
		end
	end
end