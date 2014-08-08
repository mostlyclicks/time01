module Refinery
  module HomeFeatures
    module Admin
      class HomeFeaturesController < ::Refinery::AdminController

        crudify :'refinery/home_features/home_feature',
                :xhr_paging => true

      end
    end
  end
end
