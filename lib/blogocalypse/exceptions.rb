module Blogocalypse
  class AccessDenied < StandardError
    def initialize(message = nil)
      @message = message
    end

    def to_s
      @message || "Not authorized."
    end
  end
end
