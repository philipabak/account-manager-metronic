class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name,    :null => false
      t.datetime :arrival_time, :null => false
      t.integer :party_size,    :null => false
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
