module Unshittyblog
  mattr_accessor :app_root

  class Engine < ::Rails::Engine
    isolate_namespace Unshittyblog

    initializer "unshittyblog.load_app_root" do |app|
      Unshittyblog.app_root = app.root
    end

    initializer "unshittyblog.current_user_method" do |app|
      Unshittyblog.current_user_method ||= :current_user
    end
  end
end
