class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password_hash
      t.boolean :trainer

      t.timestamps
    end
  end
end
