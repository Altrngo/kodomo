class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.float :value_float
      t.string :value_string
      t.text :comment
      t.boolean :validated
      t.references :baby, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
