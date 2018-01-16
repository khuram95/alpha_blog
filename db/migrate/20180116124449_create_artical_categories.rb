class CreateArticalCategories < ActiveRecord::Migration
  def change
    create_table :artical_categories do |t|
      t.integer :artical_id
      t.integer :category_id
    end
  end
end
