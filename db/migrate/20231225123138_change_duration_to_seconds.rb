class ChangeDurationToSeconds < ActiveRecord::Migration[7.1]
  def up
    change_column :flights, :duration, :integer
  end

  def down
    change_column :flights, :duration, :time
  end
end
