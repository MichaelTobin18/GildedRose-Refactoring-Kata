class GildedRose

  AGEDBRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  RAG = "Sulfuras, Hand of Ragnaros"
  CONJURED = "Conjured Mana Cake"

  def initialize(items)
    @items = items
  end


  def update_quality()
    @items.each do |item|
      case item.name
        when RAG
          puts 'No Change to the Mighty Ragnaros Boon'
        when BACKSTAGE_PASS
          decreaseSellIn(item, -1)
          updateBackstagePasses(item)
        when AGEDBRIE
          decreaseSellIn(item, -1)
          updateAgedBrie(item)
        when CONJURED
          decreaseSellIn(item, -1)
          updateItemQuality(item, -2)
        else
          decreaseSellIn(item, -1)
          updateItemQuality(item, -1)
      end
    end
  end
end

def decreaseSellIn(item, amount)
  if item.sell_in
    item.sell_in += amount
  end
end

def updateBackstagePasses(item)
  if item.quality > 0 && item.quality < 50
    if item.sell_in < 0
      item.quality = 0
    elsif item.sell_in > 10
      item.quality += 1
      checkQualityAmount(item)
    elsif item.sell_in <= 10 && item.sell_in > 5
      item.quality += 2
      checkQualityAmount(item)
    elsif item.sell_in <= 5
      item.quality += 3
      checkQualityAmount(item)
    end
  end
end

def checkQualityAmount(item)
  if item.quality > 50
    item.quality = 50
  end
end

def updateItemQuality(item, quality)
  if item.quality > 0 && item.quality < 50
    if item.sell_in < 0
      item.quality += -2
    else
      item.quality += quality
    end
  end
end

def updateAgedBrie(item)
  if item.quality > 0 && item.quality < 50
    if item.sell_in < 0
      puts item.name
      puts item.quality
      item.quality += 2
    else
      puts item.name
      puts item.quality
      item.quality += 1
    end
  end
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
