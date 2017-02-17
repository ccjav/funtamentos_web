class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end

    create_table :urls do |t|
      t.string :url
      t.string :short_url
      t.integer :click_count
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
