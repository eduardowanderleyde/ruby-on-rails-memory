class CreateTicketingTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :ticketing_tickets do |t|
      t.references :event, null: false, foreign_key: { to_table: :ticketing_events }
      t.integer :status, null: false, default: 0 # pending
      t.datetime :used_at

      t.timestamps
    end

    add_index :ticketing_tickets, :status
  end
end
