module Unshittyblog
  class ViewModel < Cell::Rails
    include Cell::Rails::ViewModel

    # include all the things so we can get a stupid form to render
    include ActionView::Helpers::FormHelper
    include Formtastic::Helpers::FormHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::FormTagHelper
    include ActionController::RecordIdentifier
    include Unshittyblog::ApplicationHelper

    def initialize(*args)
      super(*args)

      # include a router so we can tell where the hell we are
      @router = Unshittyblog::Router.new
    end
  end
end
