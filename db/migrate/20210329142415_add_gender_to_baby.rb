class AddGenderToBaby < ActiveRecord::Migration[6.1]
  def change
    add_column :babies, :gender, :string
  end
end
