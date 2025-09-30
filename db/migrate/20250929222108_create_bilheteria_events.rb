class CreateBilheteriaEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :bilheteria_events do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :event_date, null: false
      t.string :venue, null: false
      t.integer :max_capacity, null: false, default: 0
      t.decimal :price, precision: 10, scale: 2, null: false
      t.boolean :active, default: true
      t.string :status, default: 'draft' # draft, published, cancelled

      t.timestamps
    end

    add_index :bilheteria_events, :event_date
    add_index :bilheteria_events, :status
    add_index :bilheteria_events, :active
  end
end
