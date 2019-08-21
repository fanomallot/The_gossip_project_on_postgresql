class CreateRelationlgs < ActiveRecord::Migration[6.0]
  def change
    create_table :relationlgs do |t|
      t.references :like, null: false, foreign_key: true
      t.references :gossip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
