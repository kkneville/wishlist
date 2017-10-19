class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.references :wisher, index: true, foreign_key: true
      t.references :wished_for, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
