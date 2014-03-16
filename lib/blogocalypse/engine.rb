module Blogocalypse
  mattr_accessor :app_root

  class Engine < ::Rails::Engine
    isolate_namespace Blogocalypse

    initializer "blogocalypse.load_app_root" do |app|
      Blogocalypse.app_root = app.root
    end

    initializer "blogocalypse.current_user_method" do |app|
      Blogocalypse.current_user_method ||= :current_user
    end

    initializer "blogocalypse.date_format" do |app|
      Blogocalypse.date_format ||= "%B %-d, %Y"
    end

    initializer "blogocalypse.pagination_count" do |app|
      Blogocalypse.pagination_count ||= 10
    end
  end
end
