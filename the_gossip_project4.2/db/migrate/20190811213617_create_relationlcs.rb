class CreateRelationlcs < ActiveRecord::Migration[6.0]
  def change
    create_table :relationlcs do |t|
      t.references :like, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
