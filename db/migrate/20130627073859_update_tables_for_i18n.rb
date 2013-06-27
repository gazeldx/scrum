class UpdateTablesForI18n < ActiveRecord::Migration
  def change
    rename_column :trainers, :name,         :name_zh
    rename_column :trainers, :description,  :description_zh
    rename_column :trainers, :bio,          :bio_zh
    rename_column :trainers, :work_as,      :work_as_zh
    add_column    :trainers, :name_en,         :string
    add_column    :trainers, :description_en,  :string
    add_column    :trainers, :bio_en,          :string
    add_column    :trainers, :work_as_en,      :string

    rename_column :courses, :name,          :name_zh
    rename_column :courses, :description,   :description_zh
    rename_column :courses, :city,          :city_zh
    rename_column :courses, :location,      :location_zh
    rename_column :courses, :discount,      :discount_zh
    add_column    :courses, :name_en,          :string
    add_column    :courses, :description_en,   :string
    add_column    :courses, :city_en,          :string
    add_column    :courses, :location_en,      :string
    add_column    :courses, :discount_en,      :string
  end
end
