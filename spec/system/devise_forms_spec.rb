require "rails_helper"
require_relative "../support/devise"

RSpec.describe 'Devise user forms', type: :system do 
    describe "User form interaction" do 
        it "Sucessfully signs up a new user"  do 
        visit "/"
        click_on "Register"
        fill_in "user_user_name", with: "freya"
        fill_in "user_email", with: "freya@gmail.com"
        fill_in "user_password", with: "123456"
        fill_in "user_password_confirmation", with: "123456"
        click_on "Sign up"
        expect(page).to have_content("freya@gmail.com")
        end
    end

    describe "A logged in user can sign out" do 
        it "Sucessfully sings out a signed in user." do 
        user = User.create(:email => 'test@example.com', :user_name => "bob", :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    visit "/"
    click_on "Log out"
    expect(page).to have_content("Log in")
        end
    end
end