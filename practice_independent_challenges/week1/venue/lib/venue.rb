class Venue
  attr_reader :name, :capacity, :patrons
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = []
  end

  def add_patron(patron_name)
    @patrons << patron_name
    return @patrons
  end

  def yell_at_patrons
    @patrons.map { |patron_name| patron_name.upcase }
  end

  def over_capacity?
    if @patrons.count > @capacity 
      true
    else
      false
    end
  end

  def kick_out
    until over_capacity? == false
      @patrons.delete_at(-1)
    end
  end
end
