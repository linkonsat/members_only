require "rails_helper"
require_relative "../support/devise"

RSpec.describe 'Devise user forms', type: :system do 
    describe "A new user can sucessfully register." do 
        visit "/"
        click_on "Register"
        fill_in "user_user_name", with: "freya"
        fill_in "user_email", with: "freya@gmail.com"
        fill_in "user_password", with: "123456"
        fill_in "user_password_confirmation", with: "123456"
        expect(page).to_have content("freya@gmail.com")
    end

    describe "A logged in user can sign out" do 
        visit "/"
        user = User.create(:email => 'test@example.com', :user_name => "bob", :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    end
end