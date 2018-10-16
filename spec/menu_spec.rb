require_relative "../lib/menu.rb"

describe "Guiseppe's Menu" do
  before(:all) do
    @menu = Menu.new 'xml/menu.xml'
  end

  it "should have a food price of less than £10" do
    @menu.get_food_prices.each do |price|
      expect(price.content.delete('£').to_f).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    @menu.get_calories.each do |item|
      expect(item.content.to_i).to be < 1300
    end
  end
end
