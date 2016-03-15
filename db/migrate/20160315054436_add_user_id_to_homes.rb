class AddUserIdToHomes < ActiveRecord::Migration
  def change
  	add_column :homes, :lat, :float
    add_column :homes, :long, :float
    add_column :homes, :user_id, :integer
  end
end
