class AddListingIdToTutorialRequests < ActiveRecord::Migration
  def change
    add_column :tutorial_requests, :listing_id, :integer
  end
end
