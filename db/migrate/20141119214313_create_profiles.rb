class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string	:name
    	t.string	:surname
    	t.datetime	:birth
    	t.string	:country
   		t.timestamps
   		t.belongs_to :user
    end
  end
end
