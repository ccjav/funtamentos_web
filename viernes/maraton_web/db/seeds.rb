module DeckSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../decks.csv")
    field_names = nil
    Deck.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          user = Deck.create!(attribute_hash)
        end
      end
    end
  end
end

DeckSeeds.import

module CardSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../cards.csv")
    field_names = nil
    Card.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          user = Card.create!(attribute_hash)
        end
      end
    end
  end
end

CardSeeds.import