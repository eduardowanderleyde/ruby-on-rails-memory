class AddCodeToTicketingTickets < ActiveRecord::Migration[7.2]
  def up
    add_column :ticketing_tickets, :code, :string
    add_index  :ticketing_tickets, :code, unique: true

    # POSTGRES: preenche códigos para linhas já existentes
    execute <<~SQL
      UPDATE ticketing_tickets
      SET code = UPPER(SUBSTR(md5(random()::text || clock_timestamp()::text), 1, 10))
      WHERE code IS NULL;
    SQL

    change_column_null :ticketing_tickets, :code, false
  end

  def down
    remove_index  :ticketing_tickets, :code
    remove_column :ticketing_tickets, :code
  end
end
