class UserEventAssociation < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end
end