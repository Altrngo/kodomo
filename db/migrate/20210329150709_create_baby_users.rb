class CreateBabyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :baby_users do |t|
      t.string :role
      t.references :user, null: false, foreign_key: true
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
