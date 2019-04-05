require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks}
  end

  describe 'Instance Methods' do
    it '.average_price' do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

      @snickers = @dons.snacks.create(name: "Snickers", price: 1)
      @crunch = @dons.snacks.create(name: "Crunch", price: 3)

      expect(@dons.average_price).to eq(2)
    end
  end
end
