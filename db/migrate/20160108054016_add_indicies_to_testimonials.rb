class AddIndiciesToTestimonials < ActiveRecord::Migration
  def change
    add_index :testimonials, :featured
  end
end
