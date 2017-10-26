class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.references :lead, index: true, foreign_key: true
      t.references :dr, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
