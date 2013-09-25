class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string  :comment_title
      t.integer :points

      t.timestamps
    end
  end
end
