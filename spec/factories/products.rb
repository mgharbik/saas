FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "My product #{n}" }
	description "My product description"
	price 25.5
	client "Muller David"
	archived true
  end
end
