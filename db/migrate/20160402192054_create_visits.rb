class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :location, index: true
      t.timestamp :arrival
      t.integer :duration_seconds

      t.timestamps null: false
    end
  end
end
