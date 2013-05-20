class AddColToEnquirer < ActiveRecord::Migration
  def change
    add_column :enquirers, :recipient, :integer
  end
end
