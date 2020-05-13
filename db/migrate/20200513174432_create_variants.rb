class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :question_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
