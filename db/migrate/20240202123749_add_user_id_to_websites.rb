class AddUserIdToWebsites < ActiveRecord::Migration[7.1]
  def change
    add_reference :websites, :user, foreign_key: true
  end
end
