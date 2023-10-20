require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'validates presence of name' do
    entity = Entity.new(name: nil, amount: 10)
    expect(entity).not_to be_valid
  end

  it 'validates presence and numericality of amount' do
    entity = Entity.new(name: 'Example', amount: -5)
    expect(entity).not_to be_valid
  end
  it 'belongs to an author (User)' do
    association = Entity.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
    expect(association.class_name).to eq('User')
  end

  it 'has many entity groups' do
    association = Entity.reflect_on_association(:entity_groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'has many groups through entity groups' do
    association = Entity.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:entity_groups)
  end
end
