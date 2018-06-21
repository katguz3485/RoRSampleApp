class AddReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, index: true
  end
end
