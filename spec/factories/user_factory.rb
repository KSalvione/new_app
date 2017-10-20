FactoryGirl.define do
	sequence(:email) {|n| "user#{n}@example.com"}

	factory :user do
		email
		password "password"
		first_name "Sally"
		last_name "Smith"
		admin false
	end
end