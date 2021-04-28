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

  def trails_by_level
    trails_hash = @trails.each_with_object({}) do |trail, hash|
      hash[trail.level] = []
    end
    trails_hash.each do |k,v|
      @trails.each do |trail|
        if trail.level == k
          trails_hash[trail.level] << trail.name
        end
      end
    end
    trails_hash
    # require'pry';binding.pry
  end
end
