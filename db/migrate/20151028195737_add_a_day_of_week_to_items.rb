class AddADayOfWeekToItems < ActiveRecord::Migration
  def change
    add_column :items, :a_day_of_week, :string
  end
end
