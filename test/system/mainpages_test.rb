# frozen_string_literal: true

require 'application_system_test_case'

class MainpagesTest < ApplicationSystemTestCase
  setup do
    @mainpage = mainpages(:one)
  end

  test 'visiting the index' do
    visit mainpages_url
    assert_selector 'h1', text: 'Mainpages'
  end

  test 'should create mainpage' do
    visit mainpages_url
    click_on 'New mainpage'

    click_on 'Create Mainpage'

    assert_text 'Mainpage was successfully created'
    click_on 'Back'
  end

  test 'should update Mainpage' do
    visit mainpage_url(@mainpage)
    click_on 'Edit this mainpage', match: :first

    click_on 'Update Mainpage'

    assert_text 'Mainpage was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Mainpage' do
    visit mainpage_url(@mainpage)
    click_on 'Destroy this mainpage', match: :first

    assert_text 'Mainpage was successfully destroyed'
  end
end
