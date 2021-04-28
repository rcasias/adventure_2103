require 'time'
class Trail
  attr_reader :name,
              :length,
              :level
  def initialize(attributes)
    @name = attributes[:name]
    @length = attributes[:length]
    @level = attributes[:level]
  end
end
