class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.string :description
      t.integer :state, default: 0
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :premium

      t.timestamps
      t.index ["advertiser_name"], name: "index_offers_on_advertiser_name", unique: true, using: :btree
    end
  end
end
