class CreateTutorialRequests < ActiveRecord::Migration
  def change
    create_table :tutorial_requests do |t|
      t.string :subject
      t.string :level
      t.string :duration

      t.timestamps
    end
  end
end
