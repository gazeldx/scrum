class AddCityPriceToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :city, :string
    add_column :courses, :discount, :string
  end
end
