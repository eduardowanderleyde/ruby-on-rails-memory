class CreateTicketingEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :ticketing_events do |t|
      t.string :name
      t.text :description
      t.string :venue
      t.date :start_on
      t.date :end_on
      t.integer :status

      t.timestamps
    end
  end
end
