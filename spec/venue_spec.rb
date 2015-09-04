require('spec_helper')

describe Venue do
  it do
    should have_and_belong_to_many(:bands)
    join_table('bands_venues')
  end

  it ('returns a capitalized name') do
      new_venue = Venue.create({name: "brooklyn bowl"})
      expect(new_venue.name).to(eq("Brooklyn Bowl"))
  end

  it ('validates the presence of a name') do
    expect(Venue.create({name: ""}).valid?).to(eq(false))
  end
end
