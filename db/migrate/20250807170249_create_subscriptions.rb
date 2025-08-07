class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.date :payment_date
      t.date :next_payment_date

      t.timestamps
    end
  end
end
