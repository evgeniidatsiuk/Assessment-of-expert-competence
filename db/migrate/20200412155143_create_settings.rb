class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :experiment_count
      t.integer :model_count

      t.timestamps
    end
  end
end
