require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'validates with name and description' do
    actor = Actor.new(name: 'Bruce Lee', description: 'Legendary actor')
    expect(actor).to be_valid
  end

  it 'fails with short title' do
    actor = Actor.new(name: 'B', description: 'Legendary actor')
    expect(actor).not_to be_valid
  end

  it 'fails with very long title' do
    actor = Actor.new(name: 'Bruce Lee' * 100, description: 'Legendary actor')
    expect(actor).not_to be_valid
  end

  it 'fails without title' do
    actor = Actor.new(description: 'Legendary actor')
    expect(actor).not_to be_valid
  end

  it 'validates without description' do
    actor = Actor.new(name: 'Bruce Lee')
    expect(actor).to be_valid
  end

  it 'fails with very long description' do
    actor = Actor.new(name: 'Bruce Lee', description: 'Legendary actor' * 200)
    expect(actor).not_to be_valid
  end
end
