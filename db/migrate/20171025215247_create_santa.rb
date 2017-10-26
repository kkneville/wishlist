class CreateSanta < ActiveRecord::Migration
  def change
    create_table :santa do |t|
      t.references :user, index: true, foreign_key: true
      t.references :giftee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
