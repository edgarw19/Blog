class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :Post

      t.timestamps
    end
  end
end
