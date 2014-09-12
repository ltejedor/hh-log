require 'spec_helper'

feature 'Signing in' do
	before do
		visit '/'
		click_link 'Sign up'
		fill_in "Email", :with => "fakeemail@gmail.com"
		fill_in "Password", :with => "password123"
		fill_in "Password confirmation", :with => "password123"

		click_button "Sign up"
		click_link "Sign out"

		visit '/'
		click_link 'Sign in'
		fill_in 'Email', :with => "fakeemail@gmail.com"
		fill_in "Password", :with => "password123"
		click_button "Sign in"
	end

	scenario 'Signing in via form' do
		page.should have_content("Signed in successfully.")
	end

	scenario 'Signing in takes user back to home page' do
		page.should have_content("Current Leaderboard")
		page.should have_content("Events")
		page.should have_content("fakeemail@gmail.com")
	end

end
