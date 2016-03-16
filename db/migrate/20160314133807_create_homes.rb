class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
    	t.string :name,  default: ""
    	t.string :address,  default: ""
    	t.string :host, default: ""
    	t.string :contact,  default: ""
    	t.string :email, default: ""
    	t.string :website, default: ""
    	t.string :description, default: ""
    	t.integer :rate, default: ""
    	t.string :wifi, default: ""
    	t.string :laundry, default: ""
    	t.string :power, default: ""
    	t.integer :bathroom, default: ""
    	t.string :toilet, default: ""
    	t.boolean :heating, default: false
    	t.string :bed, default: ""
    	t.string :min_stay, default: ""
    	t.boolean :pets, default: false
    	t.boolean :bond, default: false

      t.timestamps null: false
    end
  end
end
