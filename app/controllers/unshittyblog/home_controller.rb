module Unshittyblog
  class HomeController < ApplicationController
    def index
      @posts_cell = cell(Unshittyblog::Posts)
    end
  end
end
