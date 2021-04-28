class Park
  attr_reader :name,
              :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(miles)
    @trails.find_all do |trail|
      trail_length_to_num = trail.length.chomp(" miles").to_f
      trail_length_to_num < miles
    end
  end

  def hikeable_miles
    result = @trails.sum do |trail|
      trail_length_to_num = trail.length.chomp(" miles").to_f
      trail_length_to_num
    end
    result.round(2)
  end
end
