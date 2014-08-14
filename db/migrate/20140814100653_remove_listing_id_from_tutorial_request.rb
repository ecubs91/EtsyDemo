class RemoveListingIdFromTutorialRequest < ActiveRecord::Migration
  def change
    remove_column :tutorial_requests, :listing_id, :integer
  end
end
