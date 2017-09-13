class CreateReferenceUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :reference_urls do |t|
      t.string :mini_url
      t.text :associated_url

      t.timestamps
    end
  end
end
