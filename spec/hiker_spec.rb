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

    it 'can visit park' do
      hiker = Hiker.new('Dora', :moderate)

      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})

      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})


      hiker.visit(park1)
      hiker.visit(park2)

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      expect(hiker.possible_trails).to eq([trail2, trail4, trail6])
    end

    it 'can find favoritesnack' do
      hiker = Hiker.new('Dora', :moderate)

      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})

      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})


      hiker.visit(park1)
      hiker.visit(park2)

      hiker.pack('water', 2)
      hiker.pack('trail mix', 1)
      hiker.pack('apple', 4)
      hiker.pack('carrot', 3)

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      expect(hiker.favorite_snack).to eq("apple")
    end

  end
end
