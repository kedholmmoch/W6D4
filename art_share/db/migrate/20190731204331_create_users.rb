class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :email, name: :email, unique: true
      t.index :name, name: :name, unique: true
      t.timestamps
    end
  end
end
