class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :model_id
      t.string :title
      t.integer :type

      t.timestamps
    end
  end
end
