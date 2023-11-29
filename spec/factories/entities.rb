FactoryBot.define do
  factory :entity do
    name { 'Sample Entity' }
    amount { 100.00 }
    association :user, factory: :user
  end
end
