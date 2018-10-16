require 'nokogiri'

class Menu
  attr_accessor :menu

  def initialize xml_file
    @menu = Nokogiri::XML(File.open(xml_file))
  end

  def get_food_names
    # .search from Nokigiri
    # Find all the name tags in the xml file
    @menu.search('name')
  end

  def get_food_prices
    # .search from Nokigiri
    # Find all the price tags (haha) in the xml file
    @menu.search('price')
  end

  def get_calories
    @menu.search('calories')
  end

  def get_food
    @menu.search('food')
  end

  def getXPathNames
    @menu.xpath('//name')
  end

end

bobsBurgers = Menu.new 'xml/menu.xml'
# puts bobsBurgers.get_food
# puts bobsBurgers.getXPathNames
