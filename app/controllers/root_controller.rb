class RootController < ApplicationController
  def show
    # Get the featured post and limit to first one
    @featured_post = Post.where(featured: true).first
  end
end
