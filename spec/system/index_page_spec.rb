require "rails_helper"
require_relative "../support/devise"

RSpec.describe 'Index page', type: :system do
  describe 'Displays proper index page content' do
    it "Does not display a unsigned user email" do
    visit "/"
    expect(page).to_not have_content("test-001@sample.com")
    end
  end

  describe "Event creation process" do
    it "Displays a post user email." do 
      user = User.create(:email => 'test@example.com', :user_name => "bob", :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
      visit "/"
      expect(page).to have_content('test@example.com')
    end
    it "Sucessfully creates a event." do 
      user = User.create(:email => 'test@example.com', :user_name => "bob", :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    visit "/"
      click_on 'create post'
      page.fill_in "post_title", with: "test event"
      page.fill_in "post_preview", with: "test preview"
      page.fill_in "post_body", with: "A test event"
      page.click_on "Create Post"
      expect(page).to have_content("Post was sucessfully created!")
    end

  end
end