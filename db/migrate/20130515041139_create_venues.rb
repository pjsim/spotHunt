class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.text :about
      t.string :manager
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
