class CreateMaraton < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name

      t.timestamps
    end
 
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.belongs_to :deck, index: true

      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :deck, index: true
      
      t.timestamps
    end

    create_table :guesses do |t|
      t.boolean :correct
      t.belongs_to :round, index: true

      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
