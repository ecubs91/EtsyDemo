class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :tutor_id
      t.integer :tutorial_request_id
      t.text :message
      t.boolean :success

      t.timestamps
    end
  end
end
