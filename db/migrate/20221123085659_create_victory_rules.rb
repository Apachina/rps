class CreateVictoryRules < ActiveRecord::Migration[7.0]
  def change
    create_table :victory_rules do |t|
      t.integer :item_id, null: false
      t.integer :loser_id, null: false

      t.timestamps
    end
  end
end
