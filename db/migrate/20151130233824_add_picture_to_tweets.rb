class AddPictureToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :photo, :text
  end
end
