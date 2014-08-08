module Refinery
  module HomeFeatures
    class HomeFeature < Refinery::Core::BaseModel
      self.table_name = 'refinery_home_features'

      attr_accessible :title, :description, :main_image_id, :background_image_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :main_image, :class_name => '::Refinery::Image'

      belongs_to :background_image, :class_name => '::Refinery::Image'
    end
  end
end
