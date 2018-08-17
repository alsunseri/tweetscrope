class AddImageToKeywords < ActiveRecord::Migration[5.2]
  def change
    add_column :keywords, :image, :string
  end
end
