# frozen_string_literal: true

# Restaurants migration, change type for phone number
class ChangePhoneTypeInRestaurants < ActiveRecord::Migration[7.1]
  def change
    change_column :restaurants, :phone_number, :string
  end
end
