class RemoveCreatedatFromApplies < ActiveRecord::Migration[5.1]
  def change
    remove_column :applies, :createdAt, :timestamp
  end
end
