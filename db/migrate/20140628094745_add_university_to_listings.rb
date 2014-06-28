class AddUniversityToListings < ActiveRecord::Migration
  def change
    add_column :listings, :university, :string
  end
end
