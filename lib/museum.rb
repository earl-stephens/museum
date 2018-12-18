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
    person_array = []
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include? (exhibit.name)
          person_array << patron
        end
      end
      # binding.pry
      person_array
      exhibit_interest[exhibit] = person_array
      end
    exhibit_interest
  end

end
