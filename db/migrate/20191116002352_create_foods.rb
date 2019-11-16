class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :category
      t.float :emission_amount

      t.timestamps
    end
  end
end
