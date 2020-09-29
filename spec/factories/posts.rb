FactoryBot.define do
	factory :post do
		explanation { Faker::Lorem.characters(number:140) }
		user
	end
end