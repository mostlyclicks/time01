
FactoryGirl.define do
  factory :home_feature, :class => Refinery::HomeFeatures::HomeFeature do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

