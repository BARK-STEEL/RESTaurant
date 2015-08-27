class AddPhoneNumberToServers < ActiveRecord::Migration
  def change
    add_column :servers, :phone_number, :string
  end
end
