class AddColumnsToHome < ActiveRecord::Migration
  def change
	add_column :homes, :internet, :boolean ,default: false
	add_column :homes, :tv , :boolean ,default: false
	add_column :homes, :laundry, :boolean ,default: false
	add_column :homes, :air_cond, :boolean ,default: false
	add_column :homes, :heater, :boolean ,default: false
	add_column :homes, :parking , :boolean ,default: false

  end
end
