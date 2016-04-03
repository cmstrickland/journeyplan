class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.belongs_to :negotiator
      t.timestamp :starts

      t.timestamps null: false
    end


  end
end
