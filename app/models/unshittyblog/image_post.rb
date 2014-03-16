module Unshittyblog
  class ImagePost < ActiveRecord::Base
    belongs_to :image
    belongs_to :post
  end
end
