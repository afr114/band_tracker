require('spec_helper')

describe Band do
  it do
    should have_and_belong_to_many(:venues)
    join_table('bands_venues')
  end

  it ('returns a capitalized name') do
      new_band = Band.create({name: "radiohead"})
      expect(new_band.name).to(eq("Radiohead"))
  end

  it ('validates the presence of a name') do
    expect(Band.create({name: ""}).valid?).to(eq(false))
  end
end
