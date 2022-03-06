# frozen_string_literal: true

require 'test_helper'

class MainpagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_select 'h1', 'Welcome to the club!'
  end

  test 'Should return a post when the title is searched for.' do
    get '/'
    fill_in 'title', with: 'test'
    click_on 'search'
    assert_select 'div', 'This is a test.'
  end
  test 'Should return many posts when a title has many matches' do
    get '/'
    fill_in 'title', with: 'second test'
    click_on 'search'
    assert_select 'title', { count: 2, text: 'This is the second test' }
  end

  test 'Should redirect to the user signup page when signup button is clicked' do
  end
end
