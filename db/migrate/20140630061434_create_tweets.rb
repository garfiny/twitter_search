class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :user
      t.belongs_to :trend
      t.string     :text
      t.string     :iso_language_code
      t.string     :uri
      t.timestamps
    end
  end
end
