class CreateNegotiators < ActiveRecord::Migration
  def change
    create_table :negotiators do |t|
      t.string :username, null: false
      t.timestamps null: false
    end
  end
end
