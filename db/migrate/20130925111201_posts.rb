class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :post_title
      t.string :source
      
      t.timestamps 
    end
  end
end
