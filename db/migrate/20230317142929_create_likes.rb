class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :likeable, null: false, index: true, polymorphic: true

      t.timestamps
    end
  end
end
