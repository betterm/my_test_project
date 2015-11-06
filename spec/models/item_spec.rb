require 'spec_helper'

describe Item do
  before do
    @item = Item.new(name: "Item", price: 10.00,
                     description: "Item description", a_day_of_week: Date.today, category: "First course")
  end

  subject { @item }

  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:description) }
  it { should respond_to(:a_day_of_week) }
  it { should respond_to(:category) }


  it { should be_valid }

  describe "when name is not present" do
    before { @item.name = " " }
    it { should_not be_valid }
  end

  describe "when price is not present" do
    before { @item.price = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @item.description = " " }
    it { should_not be_valid }
  end

  describe "when weekday is not present" do
    before { @item.a_day_of_week = " " }
    it { should_not be_valid }
  end

  describe "when category is not present" do
    before { @item.category = " " }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @item.name = "a" }
    it { should_not be_valid }
  end

  describe "when description is too short" do
    before { @item.description = "a" }
    it { should_not be_valid }
  end

  describe "when price is invalid" do
    before { @item.price = 0 }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      item_with_same_name = @item.dup
      item_with_same_name.name = @item.name
      item_with_same_name.save
    end

    it { should_not be_valid }
  end

end

