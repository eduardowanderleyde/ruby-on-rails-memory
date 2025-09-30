module Bilheteria
  class Ticket < ApplicationRecord
    self.table_name = 'bilheteria_tickets'
    
    # Validações
    validates :customer_name, presence: true, length: { maximum: 255 }
    validates :customer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :status, inclusion: { in: %w[pending confirmed cancelled used] }
    validates :price_paid, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :ticket_code, presence: true, uniqueness: true
    validates :purchase_date, presence: true
    
    # Relacionamentos
    belongs_to :event, class_name: 'Bilheteria::Event'
    
    # Callbacks
    before_validation :generate_ticket_code, on: :create
    before_validation :set_purchase_date, on: :create
    
    # Scopes
    scope :confirmed, -> { where(status: 'confirmed') }
    scope :pending, -> { where(status: 'pending') }
    scope :cancelled, -> { where(status: 'cancelled') }
    scope :used, -> { where(status: 'used') }
    scope :by_customer, ->(email) { where(customer_email: email) }
    scope :by_event, ->(event_id) { where(event_id: event_id) }
    
    # Métodos de instância
    def confirm!
      update!(status: 'confirmed')
    end
    
    def cancel!
      update!(status: 'cancelled')
    end
    
    def use!
      update!(status: 'used')
    end
    
    def confirmed?
      status == 'confirmed'
    end
    
    def cancelled?
      status == 'cancelled'
    end
    
    def used?
      status == 'used'
    end
    
    def can_be_cancelled?
      confirmed? && event.event_date > 24.hours.from_now
    end
    
    def can_be_used?
      confirmed? && event.event_date <= Time.current
    end
    
    # Métodos de classe
    def self.generate_unique_code
      loop do
        code = "TKT-#{SecureRandom.hex(8).upcase}"
        break code unless exists?(ticket_code: code)
      end
    end
    
    private
    
    def generate_ticket_code
      self.ticket_code ||= self.class.generate_unique_code
    end
    
    def set_purchase_date
      self.purchase_date ||= Time.current
    end
  end
end
