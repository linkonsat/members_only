require "rails_helper"
require_relative "../support/devise"

RSpec.describe 'MainPage Index', type: :system do
  describe 'Displays proper index page content' do
    it "Does not display a unsigned user email" do
    visit "/"
    expect(page).to_not have_content("test-001@sample.com")
    end
  end
end