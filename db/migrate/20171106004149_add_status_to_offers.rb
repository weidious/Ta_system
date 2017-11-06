class AddStatusToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :status, :integer
    add_column :offers, :advisor_accepted, :boolean
  end
end
