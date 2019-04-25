class AddImageToRecipes < ActiveRecord::Migration[5.2]

  def up
    add_attachment :recipes, :image
  end

  def down
    remove_attachment :recipes, :image
  end
end
