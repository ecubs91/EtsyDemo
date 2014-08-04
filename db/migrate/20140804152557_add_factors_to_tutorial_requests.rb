class AddFactorsToTutorialRequests < ActiveRecord::Migration
  def change
    add_column :tutorial_requests, :rate, :integer
    add_column :tutorial_requests, :location, :string
    add_column :tutorial_requests, :notes, :text
  end
end
