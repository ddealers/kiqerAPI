class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string 	:title
      t.string 	:text
      t.string 	:picture
      t.string 	:location
      t.boolean :approved
      t.timestamps
      t.belongs_to :user
    end
  end
end
