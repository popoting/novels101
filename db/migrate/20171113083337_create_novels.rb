class CreateNovels < ActiveRecord::Migration[5.0]
  def change
    create_table :novels do |t|
       t.string :title
       t.text :description
       t.text :comment
       t.string :author
       t.string :lead
    
      t.timestamps
    end
  end
end
