class AddTypeAndPriceToTicketingTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :ticketing_tickets, :ticket_type, :integer
    add_column :ticketing_tickets, :price_cents, :integer
  end
end
