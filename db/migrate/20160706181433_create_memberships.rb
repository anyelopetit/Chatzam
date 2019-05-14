class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true

      t.boolean :online, default: false

      t.timestamps
    end
  end
end
