require 'rails_helper'

RSpec.describe EntityGroup, type: :model do
  it 'is valid with valid attributes' do
    entity = Entity.create(id: 1)
    group = Group.create(id: 2)
    entity_group = EntityGroup.new(entity:, group:)
    expect(entity_group).to be_valid
  end

  it 'is not valid without an entity_id' do
    entity_group = EntityGroup.new(group_id: 2)
    expect(entity_group).to_not be_valid
  end

  it 'is not valid without a group_id' do
    entity_group = EntityGroup.new(entity_id: 1)
    expect(entity_group).to_not be_valid
  end

  it 'belongs to an entity' do
    association = EntityGroup.reflect_on_association(:entity)
    expect(association.macro).to eq :belongs_to
  end

  it 'belongs to a group' do
    association = EntityGroup.reflect_on_association(:group)
    expect(association.macro).to eq :belongs_to
  end
end
