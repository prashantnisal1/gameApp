class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :rank
      t.string :suit
      t.references :user_game

      t.timestamps
    end
  end
end
