module Refinery
  module HomeFeatures
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::HomeFeatures

      engine_name :refinery_home_features

      initializer "register refinerycms_home_features plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "home_features"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.home_features_admin_home_features_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/home_features/home_feature'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::HomeFeatures)
      end
    end
  end
end
