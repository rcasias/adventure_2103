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
  end
end
