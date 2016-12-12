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
      # if item.name != AGEDBRIE and item.name != BACKSTAGE_PASS
      #   if item.quality > 0
      #     if item.name != RAG
      #       item.quality = item.quality - 1
      #     end
      #   end
      # else
      #   if item.quality < 50
      #     item.quality = item.quality + 1
      #     if item.name == BACKSTAGE_PASS
      #       if item.sell_in < 11
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #       if item.sell_in < 6
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #     end
      #   end
      # end
      # if item.name != RAG
      #   item.sell_in = item.sell_in - 1
      # end
      # if item.sell_in < 0
      #   if item.name == AGEDBRIE
      #     increaseItemQuality(item)
      #   elsif item.name == BACKSTAGE_PASS
      #     decreaseItemQuality(item, item.quality)
      #   elsif item.name == RAG
      #   else
      #     decreaseItemQuality(item, 1)
      #   end
      # end


      case item.name
        when RAG
          puts 'No Change to the Mighty Ragnaros Boon'
        when BACKSTAGE_PASS
          updateItemQuality(item, 1)
          decreaseSellIn(item, -1)
        when AGEDBRIE
          updateItemQuality(item, 1)
          decreaseSellIn(item, -1)
        when CONJURED
          updateItemQuality(item, -2)
          decreaseSellIn(item, -1)
        else
          updateItemQuality(item, -1)
          decreaseSellIn(item, -1)
      end
    end
  end
end

def decreaseSellIn(item, amount)
  if item.sell_in > 0
    item.sell_in += amount
  end
end

def updateItemQuality(item, quality)
  if item.quality > 0 && item.quality < 50
    item.quality += quality
  end
end

def increaseItemQuality(item, quality)
  if item.quality >0 && item.quality < 50
    item.quality += quality
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
