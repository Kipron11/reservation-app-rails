class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :transport, null: false, foreign_key: true
      t.string :time

      t.timestamps
    end
  end
end
