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

    initializer "blogocalypse.default_image_size" do |app|
      Blogocalypse.default_image_size ||= "1170x1170#"
    end

    initializer "blogocalypse.can?" do |app|
      Blogocalypse.can ||= Proc.new { |user, resource, action, model| false }
    end

    initializer "blogocalypse.action_to_crud_map" do |app|
      Blogocalypse.action_to_crud_map = {
        :new     => :create,
        :create  => :create,
        :show    => :read,
        :index   => :read,
        :edit    => :update,
        :update  => :update,
        :destroy => :destroy
      }
    end
  end
end
