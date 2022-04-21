# frozen_string_literal: true

FactoryBot.define do
    factory :user do
      id { 1 }
      email { "test_user@random.com"}
      password { "123456" }
    end
  end
  