class AddUserIdToTutorialRequests < ActiveRecord::Migration
  def change
    add_column :tutorial_requests, :user_id, :integer
  end
end
