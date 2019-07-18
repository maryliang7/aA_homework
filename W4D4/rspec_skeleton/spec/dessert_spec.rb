require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:ice_cream) { Dessert.new("ice_cream", 100, "chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(ice_cream.type).to eq("ice_cream")
    end

    it "sets a quantity" do
      expect(ice_cream.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(ice_cream.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("ice_cream", "tons")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      ice_cream.add_ingredient("milk")
      expect(ice_cream.ingredients).to include("milk")

    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['milk', 'cream', 'vanilla', 'sugar']
      ingredients.each { |item| ice_cream.add_ingredient(item)}
      ice_cream.mix!
      expect(ice_cream.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      ice_cream.eat(50)
      expect(ice_cream.quantity).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { ice_cream.eat(200) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      ice_cream.serve
      expect(ice_cream.serve).to eq("Chef has made 100 ice_creams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      ice_cream.make_more
      expect(ice_cream.chef).to receive(:bake).with(ice_cream)
    end
  end
end
