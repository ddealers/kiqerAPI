class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string	:name
    	t.string	:surname
    	t.datetime	:birth
    	t.string	:country
   		t.timestamps
    end
  end
end