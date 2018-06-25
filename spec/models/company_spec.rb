require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'validates with name and description' do
    company = Company.new(title: '20th Century Fox', description: 'Legendary company')
    expect(company).to be_valid
  end

  it 'fails with short title' do
    company = Company.new(title: '2', description: 'Legendary company')
    expect(company).not_to be_valid
  end

  it 'fails with very long title' do
    company = Company.new(title: '20th Century Fox' * 100, description: 'Legendary company')
    expect(company).not_to be_valid
  end

  it 'fails without title' do
    company = Company.new(description: 'Legendary company')
    expect(company).not_to be_valid
  end

  it 'validates without description' do
    company = Company.new(title: '20th Century Fox')
    expect(company).to be_valid
  end

  it 'fails with very long description' do
    company = Company.new(title: '20th Century Fox', description: 'Legendary company' * 200)
    expect(company).not_to be_valid
  end
end
