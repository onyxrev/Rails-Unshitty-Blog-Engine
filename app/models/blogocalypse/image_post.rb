module Blogocalypse
  class ImagePost < ActiveRecord::Base
    belongs_to :image
    belongs_to :post
  end
end
