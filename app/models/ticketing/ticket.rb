module Ticketing
  class Ticket < ::ApplicationRecord
    self.table_name = "ticketing_tickets"

    belongs_to :event, class_name: "Ticketing::Event"

    enum :status, { pending: 0, paid: 1, canceled: 2 }
    enum :ticket_type, { inteira: 0, estudante: 1, idoso: 2, isento: 3 }

    before_validation { self.code ||= SecureRandom.alphanumeric(10).upcase }
    validates :code, presence: true, uniqueness: true
    validates :ticket_type, presence: true
    validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
  end
end
