require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

    @snickers = @dons.snacks.create(name: "Snickers", price: 1)
    @crunch = @dons.snacks.create(name: "Crunch", price: 2)
  end

  scenario 'they see the location of that machine' do

    visit machine_path(@dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'shows the name of all items in vending machine, along with their price' do

    visit machine_path(@dons)

    expect(page).to have_content("Snickers")
    expect(page).to have_content("Price #{@snickers.price}")
    expect(page).to have_content("Crunch")
    expect(page).to have_content("Price #{@crunch.price}")
  end

  it 'shows the average price of all items in the machine' do

    visit machine_path(@dons)

    expect(page).to have_content("Average Price #{@dons.average_price}")
  end
end
