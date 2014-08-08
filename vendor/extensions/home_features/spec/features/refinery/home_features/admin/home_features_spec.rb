# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "HomeFeatures" do
    describe "Admin" do
      describe "home_features" do
        refinery_login_with :refinery_user

        describe "home_features list" do
          before do
            FactoryGirl.create(:home_feature, :title => "UniqueTitleOne")
            FactoryGirl.create(:home_feature, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.home_features_admin_home_features_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.home_features_admin_home_features_path

            click_link "Add New Home Feature"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::HomeFeatures::HomeFeature.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::HomeFeatures::HomeFeature.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:home_feature, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.home_features_admin_home_features_path

              click_link "Add New Home Feature"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::HomeFeatures::HomeFeature.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:home_feature, :title => "A title") }

          it "should succeed" do
            visit refinery.home_features_admin_home_features_path

            within ".actions" do
              click_link "Edit this home feature"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:home_feature, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.home_features_admin_home_features_path

            click_link "Remove this home feature forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::HomeFeatures::HomeFeature.count.should == 0
          end
        end

      end
    end
  end
end
