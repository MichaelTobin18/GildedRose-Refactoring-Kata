class GildedRose

  AGEDBRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  RAG = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @items = items
  end


  def update_quality()
    @items.each do |item|
      if item.name != AGEDBRIE and item.name != BACKSTAGE_PASS
        if item.quality > 0
          if item.name != RAG
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == BACKSTAGE_PASS
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != RAG
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != AGEDBRIE
          if item.name != BACKSTAGE_PASS
            if item.quality > 0
              if item.name != RAG
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
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
