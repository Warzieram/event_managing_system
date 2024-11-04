class AddRefToEvent < ActiveRecord::Migration[7.2]
  def change
    add_reference :events, :administrated_event, index: true
  end
end
