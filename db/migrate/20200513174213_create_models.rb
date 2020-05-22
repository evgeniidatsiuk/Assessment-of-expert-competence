class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :a
      t.integer :b
      t.integer :t
      t.integer :p

      t.timestamps
    end
  end
end
