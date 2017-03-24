class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.references :workout, foreign_key: true
      t.string :event_name
      t.datetime :start_event
      t.datetime :end_event
      t.string :event_location
      t.belongs_to :happenings, polymorphic: true

      t.timestamps
    end
    add_index :events, [:happenings_id, :happenings_type]
  end
end
