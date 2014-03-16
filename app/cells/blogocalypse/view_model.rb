module Blogocalypse
  class ViewModel < BaseCell
    include Cell::Rails::ViewModel

    # include all the things so we can get a stupid form to render
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::FormTagHelper
    include ActionController::RecordIdentifier
    include Blogocalypse::ApplicationHelper

    def initialize(*args)
      super(*args)

      # include a router so we can tell where the hell we are
      @router = Blogocalypse::Router.new
    end
  end
end
