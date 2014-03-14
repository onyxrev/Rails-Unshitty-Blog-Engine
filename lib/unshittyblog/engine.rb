module Unshittyblog
  mattr_accessor :app_root

  class Engine < ::Rails::Engine
    isolate_namespace Unshittyblog

    initializer "my_engine.load_app_root" do |app|
      Unshittyblog.app_root = app.root
    end
  end
end
