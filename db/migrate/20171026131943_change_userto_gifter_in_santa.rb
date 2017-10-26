class ChangeUsertoGifterInSanta < ActiveRecord::Migration
  def change
  	rename_column :santa, :user_id, :gifter_id
  end
end
