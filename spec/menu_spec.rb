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

  it "should have no items with calories over 1000 except for the full breakfast" do
    @menu.get_food.each do |item|
      if item.search('name')[0].content == "Full Breakfast"
        expect(item.search('calories')[0].content.to_i).to eq 1200
      else
        expect(item.search('calories')[0].content.to_i).to be < 1000
      end
    end
  end
end
