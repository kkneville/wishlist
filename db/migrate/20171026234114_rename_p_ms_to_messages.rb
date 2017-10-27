class RenamePMsToMessages < ActiveRecord::Migration
  def change
  	rename_table :PMs, :messages
  end
end
