class AlterUserTable < ActiveRecord::Migration
  def change
  	remove_column :homes , :wifi
  	remove_column :homes , :laundry
  	remove_column :homes , :heating
  	remove_column :homes , :bathroom
  	remove_column :homes , :power
  	remove_column :homes , :toilet
  	remove_column :homes , :bed

  	rename_column :homes , :name , :title
    add_column :homes , :h_type , :string
  end
end
