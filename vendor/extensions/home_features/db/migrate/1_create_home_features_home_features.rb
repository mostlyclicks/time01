class CreateHomeFeaturesHomeFeatures < ActiveRecord::Migration

  def up
    create_table :refinery_home_features do |t|
      t.string :title
      t.text :description
      t.integer :main_image_id
      t.integer :background_image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-home_features"})
    end

    drop_table :refinery_home_features

  end

end
