require 'pry'
class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include? exhibit.name
        recommended_exhibits << exhibit
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_interest = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          exhibit_interest[exhibit.name] = [] if exhibit_interest[exhibit.name].nil?
          exhibit_interest[exhibit.name] << patron
        end
      end
    end
    exhibit_interest.sort_by do |ex|
      @patrons.count
    end.to_h
  end

end
