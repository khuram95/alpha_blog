class CreateArticals < ActiveRecord::Migration
  def change
    create_table :articals do |t|
      t.string:title
    end
  end
end
