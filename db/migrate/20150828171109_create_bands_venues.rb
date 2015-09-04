class CreateBandsVenues < ActiveRecord::Migration
  def change
    create_table(:bands_venues), id: false do |t|
      t.integer :band_id
      t.integer :venue_id

      t.timestamps()
    end
  end
end
