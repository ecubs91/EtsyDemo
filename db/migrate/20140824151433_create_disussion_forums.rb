class CreateDisussionForums < ActiveRecord::Migration
  def change
    create_table :disussion_forums do |t|
      t.string :subject
      t.text :question
      t.text :details

      t.timestamps
    end
  end
end
