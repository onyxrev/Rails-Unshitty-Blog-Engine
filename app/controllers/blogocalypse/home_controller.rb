module Blogocalypse
  class HomeController < ApplicationController
    def index
      @posts_cell = cell(Blogocalypse::Posts)
    end
  end
end
