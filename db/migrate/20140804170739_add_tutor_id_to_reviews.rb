class AddTutorIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :tutor_id, :integer
  end
end
