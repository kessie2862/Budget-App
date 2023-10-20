# In your spec/factories/categories.rb (or an appropriate location)
FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    icon { 'category.png' }
    user
    # Add any other attributes you need
  end
end
