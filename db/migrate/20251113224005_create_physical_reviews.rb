class CreatePhysicalReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :physical_reviews do |t|
      t.timestamps

      t.references :user, null: false, foreign_key: :user_id
      t.references :personal_trainer, null: false, foreign_key: :personal_trainer_id
      t.date :review_date, null: false
      t.decimal :weight, null: false, precision: 1
      t.decimal :height, null: false, precision: 1
      t.decimal :body_fat_percentage, precision: 2
    end
  end
end
