class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :post, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.integer :parent_id, null: true

      t.timestamps
    end
  end
end
