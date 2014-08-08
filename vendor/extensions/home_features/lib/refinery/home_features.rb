require 'refinerycms-core'

module Refinery
  autoload :HomeFeaturesGenerator, 'generators/refinery/home_features_generator'

  module HomeFeatures
    require 'refinery/home_features/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
