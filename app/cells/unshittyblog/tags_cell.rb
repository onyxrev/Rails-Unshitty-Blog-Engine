module Unshittyblog
  class TagsCell < ViewModel
    property :tags

    def show
      render
    end

    def edit(args = {})
      @form = args[:form]

      render
    end
  end
end
