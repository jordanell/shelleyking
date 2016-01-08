class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.text    :quote, null: false
      t.string  :name, null: false
      t.boolean :featured, default: false
      t.integer :position

      t.timestamps
    end
  end
end
