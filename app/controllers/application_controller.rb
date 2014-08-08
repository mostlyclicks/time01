class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_home_features

  protected

  def load_home_features
    @home_features = Refinery::HomeFeatures::HomeFeature.all
  end
end
