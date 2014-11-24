class AddEnabledStateToNavigation < ActiveRecord::Migration
  def change
    add_column :navigations, :nav_enabled, :boolean
  end
end
