class AddDeptToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dept, :string
  end
end
