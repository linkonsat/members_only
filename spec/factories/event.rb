# frozen_string_literal: true

FactoryBot.define do 
  sequence :id do |n|
    n 
  end
end

FactoryBot.define do
    
    factory :post do
      id { generate :id}
      user_id { 1 }
    end
  end