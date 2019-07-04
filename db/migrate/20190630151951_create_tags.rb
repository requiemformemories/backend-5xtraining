class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tagname, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
