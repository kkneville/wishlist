class ChangeDeptInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :dept, :dept_id
  	change_column :users, :dept_id, :integer
  	has_many :users
  end
end
