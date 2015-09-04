class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues, join_table: 'bands_venues')
  validates(:name, :presence => true)
  before_save(:capitalize_name)


private

def capitalize_name
    name = self.name
    capitalize_name = name.split(" ")
    capitalize_name.each() do |name|
      name.capitalize!()
    end
    self.name = capitalize_name.join(" ")
  end
end
