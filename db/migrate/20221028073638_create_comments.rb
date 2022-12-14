class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid
      t.text :text
      t.references :author, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
