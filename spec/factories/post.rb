# frozen_string_literal: true

FactoryBot.define do
    factory :posts do
      sequence(:id, 100) { |n| n }
    end
  end
  