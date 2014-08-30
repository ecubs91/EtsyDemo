class AddEnquiryIdToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :enquiry_id, :integer
  end
end
