class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,    :null => false
      t.string :password, :null => false
      t.belongs_to :location, index: true

      t.timestamps
    end

    add_index :users, :email, :unique => true

  end
end
