class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.references :workout, foreign_key: true
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :event_location
      t.string :color
      t.belongs_to :happenings, polymorphic: true

      t.timestamps
    end
    add_index :events, [:happenings_id, :happenings_type]
  end
end
