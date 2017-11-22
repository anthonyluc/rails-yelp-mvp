class ChangePhoneNumberType < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :phone_number, :string
  end
end
