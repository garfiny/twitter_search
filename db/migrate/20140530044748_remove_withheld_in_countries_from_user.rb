class RemoveWithheldInCountriesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :withheld_in_countries
  end
end
