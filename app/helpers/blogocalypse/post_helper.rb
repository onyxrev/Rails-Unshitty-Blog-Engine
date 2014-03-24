module Blogocalypse
  module PostHelper
    def can_create_post?
      Blogocalypse.can.call host_user, :create, @post, Post
    end
  end
end
