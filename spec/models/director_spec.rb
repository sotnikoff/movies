require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'validates with name and description' do
    director = Director.new(name: 'Quentin Tarantino', description: 'Legendary director')
    expect(director).to be_valid
  end

  it 'fails with short title' do
    director = Director.new(name: 'Q', description: 'Legendary director')
    expect(director).not_to be_valid
  end

  it 'fails with very long title' do
    director = Director.new(name: 'Quentin Tarantino' * 100, description: 'Legendary director')
    expect(director).not_to be_valid
  end

  it 'fails without title' do
    director = Director.new(description: 'Legendary director')
    expect(director).not_to be_valid
  end

  it 'validates without description' do
    director = Director.new(name: 'Quentin Tarantino')
    expect(director).to be_valid
  end

  it 'fails with very long description' do
    director = Director.new(name: 'Quentin Tarantino', description: 'Legendary director' * 200)
    expect(director).not_to be_valid
  end
end
