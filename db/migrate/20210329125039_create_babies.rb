class CreateBabies < ActiveRecord::Migration[6.1]
  def change
    create_table :babies do |t|
      t.string :name
      t.date :birth_date
      t.float :weight
      t.integer :height

      t.timestamps
    end
  end
end
