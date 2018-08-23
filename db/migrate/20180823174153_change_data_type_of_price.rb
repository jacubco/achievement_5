class ChangeDataTypeOfPrice < ActiveRecord::Migration[5.2]
  def change
    change_column :price, :integer
  end
end
