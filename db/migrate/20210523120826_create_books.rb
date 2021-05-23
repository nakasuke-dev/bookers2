class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title,   null: false, default: ""
      t.string :opinion, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
