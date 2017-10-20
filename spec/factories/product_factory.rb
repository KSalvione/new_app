FactoryGirl.define do
	sequence(:id) {|n| "#{n}"}

	factory :product do
		id
		name "item"
		description "described"
		price "5"
		colour "black"
	end
	
end