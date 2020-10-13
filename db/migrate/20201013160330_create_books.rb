class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.integer :isbn
      t.string :average_ratings
      t.string :decimal
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
