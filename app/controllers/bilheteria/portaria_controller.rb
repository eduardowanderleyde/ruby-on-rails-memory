class Bilheteria::PortariaController < Bilheteria::ApplicationController
  def index
    @event = if params[:event_id].present?
      Ticketing::Event.find(params[:event_id])
    else
      Ticketing::Event.published.order(:start_on).first
    end

    @today_free = today_free?
    @prices = TICKETING_PRICES
  end

  def sell
    event  = Ticketing::Event.find(params[:event_id])
    counts = params.require(:counts).permit(:inteira, :estudante, :idoso, :isento)
    free   = today_free?
    created = []

    Ticketing::Ticket.transaction do
      counts.each do |kind, qty|
        qty.to_i.times do
          created << event.tickets.create!(
            status: :paid,
            ticket_type: kind,
            price_cents: free ? 0 : (TICKETING_PRICES[kind.to_sym] || 0)
          )
        end
      end
    end

    total = created.sum(&:price_cents)
    redirect_to bilheteria_portaria_path(event_id: event.id),
      notice: "Venda concluída. Total: R$ #{format('%.2f', total/100.0)}"
  end

  private

  def today_free?
    Date.current.tuesday?
  end
end
