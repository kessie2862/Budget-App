require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is registerable' do
    user = User.new(name: 'Prosper Kessie', email: 'prosper@gmail.com', password: 'microverse')
    expect(user.save).to be true
  end

  it 'has many entities' do
    association = User.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_many)
    expect(association.class_name).to eq('entity')
  end

  it 'is database authenticatable' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user.valid_password?('password')).to be true
  end

  it 'has many groups' do
    association = User.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
  end

  it 'validates presence of name' do
    user = User.new(name: nil, email: 'test@example.com', password: 'password')
    expect(user).not_to be_valid
  end
end
