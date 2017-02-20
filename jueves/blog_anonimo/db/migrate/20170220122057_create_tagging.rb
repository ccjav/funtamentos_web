class CreateTagging < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title, :null => false
      t.string :author, :null => false
      t.text :body, :null => false
      t.date :date

      t.timestamps      
    end

    create_table :tags do |t|
      t.string :tag, :null => false

      t.timestamps
    end

    create_table :taggings do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
      
      t.timestamps      
    end
  end
end
