class CreateAthleteProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :athlete_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.decimal :height
      t.decimal :weight
      t.integer :age
      t.date :date_of_birth
      t.string :gender
      t.string :fitness_level
      t.text :goals
      t.text :medical_conditions
      t.string :whatsapp
      t.string :city

      t.timestamps
    end
  end
end
