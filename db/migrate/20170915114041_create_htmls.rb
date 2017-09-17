class CreateHtmls < ActiveRecord::Migration[5.1]
  def change
    create_table :htmls do |t|
      t.string :code
      t.text :content

      t.timestamps
    end
  end
end
