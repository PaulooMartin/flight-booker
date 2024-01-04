class AddAssociationToPassenger < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to(:passengers, :booking)
  end
end
