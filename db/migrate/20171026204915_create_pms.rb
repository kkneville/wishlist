class CreatePms < ActiveRecord::Migration
  def change
    create_table :pms do |t|
      t.string :content
      t.references :sender, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
