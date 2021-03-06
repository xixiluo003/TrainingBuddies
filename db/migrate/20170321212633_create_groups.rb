class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.references :user, foreign_key: true
      t.string :group_type
      t.text :group_goal

      t.timestamps
    end
  end
end
