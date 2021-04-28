require "./lib/trail"
require "./lib/park"


RSpec.describe 'Park' do
  it 'exists' do
    park1 = Park.new('Capitol Reef')

    expect(park1).to be_instance_of(Park)
  end

  context "initialize works" do
    it 'has attributes' do
      park1 = Park.new('Capitol Reef')

      expect(park1.name).to eq('Capitol Reef')
      expect(park1.trails).to eq([])
    end
  end

  context "methods" do
    it 'can add trail' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park2.add_trail(trail3)

      expect(park1.trails).to eq([trail1, trail2])
      expect(park2.trails).to eq([trail3])
    end

    it 'can list tails below length' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park2.add_trail(trail3)

      expect(park1.trails_shorter_than(2.5)).to eq([trail1, trail2])
    end

    it 'can list tails added length' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park2.add_trail(trail3)

      expect(park1.hikeable_miles).to eq(3.9)
    end

    it 'can return hash with trails by level' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})

      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      result = {
        :easy => ["Grand Wash"],
        :moderate => ["Cohab Canyon"],
        :strenuous => ["Chimney Rock Loop"]
      }

      result2 = {
        :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
        :easy => ["Rim Trail"]
      }

      expect(park1.trails_by_level).to eq(result)
      expect(park2.trails_by_level).to eq(result2)
    end

  end
end
