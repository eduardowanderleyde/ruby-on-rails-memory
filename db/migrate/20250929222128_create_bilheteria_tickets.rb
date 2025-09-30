class CreateBilheteriaTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :bilheteria_tickets do |t|
      t.references :event, null: false, foreign_key: { to_table: :bilheteria_events }
      t.string :customer_name, null: false
      t.string :customer_email, null: false
      t.string :seat_number
      t.string :status, default: 'pending' # pending, confirmed, cancelled, used
      t.datetime :purchase_date, null: false
      t.decimal :price_paid, precision: 10, scale: 2, null: false
      t.string :ticket_code, null: false

      t.timestamps
    end

    add_index :bilheteria_tickets, :customer_email
    add_index :bilheteria_tickets, :status
    add_index :bilheteria_tickets, :ticket_code, unique: true
  end
end
