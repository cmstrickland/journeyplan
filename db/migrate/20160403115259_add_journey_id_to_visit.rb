class AddJourneyIdToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :journey_id, :integer, index: true
  end
end
