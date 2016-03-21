class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string  :title, null: false
      t.text    :description
      t.integer :position

      t.timestamps
    end
  end
end
