class CreateBadginations < ActiveRecord::Migration
  def change
    create_table :badginations do |t|
      t.integer :user_id
      t.integer :badge_id
      t.integer :position
      t.datetime :created_at

      t.timestamps
    end
  end
end
