# frozen_string_literal: true

FactoryBot.define do
    factory :post do
      sequence(:id) { |n| n }
      user_id { 1 }
    end
  end