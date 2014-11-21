class CreateKiqs < ActiveRecord::Migration
  def change
    create_table :kiqs do |t|
      t.integer :follow
      t.integer :follower

      t.timestamps
    end
  end
end
