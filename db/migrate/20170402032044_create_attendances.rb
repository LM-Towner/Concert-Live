class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false
      t.references :concert, null: false

      t.timestamps(null: false)
    end
  end
end
