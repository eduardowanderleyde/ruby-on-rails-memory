module Ticketing
  class Event < ::ApplicationRecord
    self.table_name = "ticketing_events"

    has_many :tickets, class_name: "Ticketing::Ticket", inverse_of: :event, dependent: :destroy

    enum :status, { draft: 0, published: 1, archived: 2 }
    validates :name, presence: true
  end
end
