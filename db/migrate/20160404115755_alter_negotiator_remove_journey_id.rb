class AlterNegotiatorRemoveJourneyId < ActiveRecord::Migration
  def change
    remove_column :negotiators, :journey_id
  end
end
