# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    
  end

  factory :comment do
    
  end

  factory :like do
    
  end

  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password { '123456' }
  end

  factory :post do 
    user_id { 1 }
  end
end
