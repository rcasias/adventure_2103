class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
    @parks_visited = []
  end

  def pack(snack, amount)
    @snacks[snack] = amount
  end

  def visit(park)
    @parks_visited << park
  end

  def possible_trails
    array = []
    @parks_visited.each do |park|
      park.trails.each do |trail|
        if trail.level == experience_level
          array << trail
        end
      end
    end
    array
  end

  def favorite_snack
    result = @snacks.max_by do |k, v|
      v
    end
    result[0]
  end
end
