class UpdateTablesForI18n < ActiveRecord::Migration
  def change
    rename_column :trainers, :name,         :name_zh
    rename_column :trainers, :description,  :description_zh
    rename_column :trainers, :bio,          :bio_zh
    rename_column :trainers, :work_as,      :work_as_zh
    add_column    :trainers, :name_en,         :string
    add_column    :trainers, :description_en,  :text
    add_column    :trainers, :bio_en,          :text
    add_column    :trainers, :work_as_en,      :string

    rename_column :courses, :name,          :name_zh
    rename_column :courses, :description,   :description_zh
    rename_column :courses, :city,          :city_zh
    rename_column :courses, :location,      :location_zh
    rename_column :courses, :discount,      :discount_zh
    add_column    :courses, :name_en,          :string
    add_column    :courses, :description_en,   :text
    add_column    :courses, :city_en,          :string
    add_column    :courses, :location_en,      :string
    add_column    :courses, :discount_en,      :string

    rename_column :news_and_events, :title,     :title_zh
    rename_column :news_and_events, :body,      :body_zh
    rename_column :news_and_events, :abstract,  :abstract_zh
    add_column    :news_and_events, :title_en,     :string
    add_column    :news_and_events, :body_en,      :string
    add_column    :news_and_events, :abstract_en,  :string
  end
end
