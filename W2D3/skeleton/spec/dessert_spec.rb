require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "jacob") }
  subject(:pazookie) { Dessert.new("Ice Cream Cookie", 1, chef) }
  # let(:ingredient) { double("Vanilla Ice Cream") }

  describe "#initialize" do
    it "sets a type" do
      expect(:type).to_not be_nil
    end

    it "sets a quantity" do
      expect(:quantity).to_not be_nil
    end

    it "starts ingredients as an empty array" do
      expect(pazookie.ingredients).to match_array([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {pazookie.quantity = "a"}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pazookie.add_ingredient("Vanilla Ice Cream")
      expect(pazookie.ingredients).to_not be_empty
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      pazookie.add_ingredient("Cookie Dough")
      pazookie.add_ingredient("Vanilla Ice Cream")
      pazookie.add_ingredient("Chocolate Chips")
      arr = pazookie.ingredients.dup
      expect(pazookie.mix!).to_not eq(arr)

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(pazookie.eat(pazookie.quantity)).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pazookie.eat(2) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Jacob")
      expect(pazookie.serve).to include("Jacob")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pazookie)
      pazookie.make_more
    end
  end
end
