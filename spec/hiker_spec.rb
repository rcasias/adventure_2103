require "./lib/trail"
require "./lib/park"
require "./lib/hiker"


RSpec.describe 'Park' do
  it 'exists' do
    hiker = Hiker.new('Dora', :moderate)

    expect(hiker).to be_instance_of(Hiker)
  end

  context "initialize works" do
    it 'has attributes' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.name).to eq('Dora')
      expect(hiker.experience_level).to eq(:moderate)
      expect(hiker.snacks).to eq({})
      expect(hiker.parks_visited).to eq([])
    end
  end

  context "methods" do
    it 'can pack snacks' do
      hiker = Hiker.new('Dora', :moderate)
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)

      result = {
        "water" => 1,
        "trail mix" => 3
      }
      expect(hiker.snacks).to eq(result)
    end

    it 'can visit park' do
      hiker = Hiker.new('Dora', :moderate)

      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      hiker.visit(park1)
      hiker.visit(park2)

      expect(hiker.parks_visited).to eq([park1, park2])
    end
  end
end
