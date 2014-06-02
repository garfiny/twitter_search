class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.string :caller
      t.string :status
      t.string :report
      t.decimal :progress
      t.timestamps
    end
  end
end
