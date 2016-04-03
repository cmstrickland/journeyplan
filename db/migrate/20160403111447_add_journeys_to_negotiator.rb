class AddJourneysToNegotiator < ActiveRecord::Migration
  def change
    add_column :negotiators, :journey_id, :integer
    add_index :negotiators, :journey_id
  end
end
