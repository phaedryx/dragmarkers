class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|

      t.timestamps
    end
  end
end
