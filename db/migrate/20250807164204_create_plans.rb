class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      t.integer :duration_days
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
