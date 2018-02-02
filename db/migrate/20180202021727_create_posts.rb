class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :image

      t.timestamps
    end
  end
end
