module Bilheteria
  class Event < ApplicationRecord
    self.table_name = 'bilheteria_events'
    
    # Validações
    validates :name, presence: true, length: { maximum: 255 }
    validates :event_date, presence: true
    validates :venue, presence: true, length: { maximum: 255 }
    validates :max_capacity, presence: true, numericality: { greater_than: 0 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :status, inclusion: { in: %w[draft published cancelled] }
    
    # Relacionamentos
    has_many :tickets, class_name: 'Bilheteria::Ticket', foreign_key: 'event_id', dependent: :destroy
    
    # Scopes
    scope :active, -> { where(active: true) }
    scope :published, -> { where(status: 'published') }
    scope :upcoming, -> { where('event_date > ?', Time.current) }
    scope :by_date, -> { order(:event_date) }
    
    # Métodos de instância
    def available_capacity
      max_capacity - tickets.confirmed.count
    end
    
    def sold_out?
      available_capacity <= 0
    end
    
    def can_sell_tickets?
      active? && published? && !sold_out? && event_date > Time.current
    end
    
    def total_revenue
      tickets.confirmed.sum(:price_paid)
    end
    
    def tickets_sold
      tickets.confirmed.count
    end
    
    # Métodos de classe
    def self.search(query)
      where("name ILIKE ? OR venue ILIKE ?", "%#{query}%", "%#{query}%")
    end
  end
end
