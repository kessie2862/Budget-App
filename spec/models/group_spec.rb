require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'validates presence of name' do
    group = Group.new(name: nil, icon: 'example_icon')
    expect(group).not_to be_valid
  end

  it 'validates presence of icon' do
    group = Group.new(name: 'Example Group', icon: nil)
    expect(group).not_to be_valid
  end
  it 'belongs to a user' do
    association = Group.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many entity groups' do
    association = Group.reflect_on_association(:entity_groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'has many entities through entity groups' do
    association = Group.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:entity_groups)
  end
end
