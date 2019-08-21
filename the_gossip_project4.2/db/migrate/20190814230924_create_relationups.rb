class CreateRelationups < ActiveRecord::Migration[6.0]
  def change
    create_table :relationups do |t|
      t.references :private_message, null: false, foreign_key: true
      t.references :recipient,index: true

      t.timestamps
    end
  end
end
