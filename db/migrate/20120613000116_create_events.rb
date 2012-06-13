class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :kind

      t.timestamps
    end
  end
end
