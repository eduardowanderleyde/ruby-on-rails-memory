class Bilheteria::TicketsController < Bilheteria::ApplicationController
  before_action :set_event
  before_action :set_ticket, only: %i[show edit update destroy confirm cancel use]

  def index
    @tickets = @event.tickets
  end

  def show
  end

  def new
    @ticket = @event.tickets.new
  end

  def create
    @ticket = @event.tickets.new(ticket_params)
    @ticket.save ? redirect_to([:bilheteria, @event, @ticket]) : render(:new)
  end

  def edit
  end

  def update
    @ticket.update(ticket_params) ? redirect_to([:bilheteria, @event, @ticket]) : render(:edit)
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path_for(@event)
  end

  def confirm
    @ticket.update!(status: :paid)
    redirect_to [:bilheteria, @event, @ticket]
  end

  def cancel
    @ticket.update!(status: :canceled)
    redirect_to [:bilheteria, @event, @ticket]
  end

  def use
    @ticket.update!(used_at: Time.current)
    redirect_to [:bilheteria, @event, @ticket]
  end

  private

  def set_event
    @event = Ticketing::Event.find(params[:event_id])
  end

  def set_ticket
    @ticket = @event.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticketing_ticket).permit(:ticket_type_id)
  end

  def tickets_path_for(e)
    bilheteria_event_tickets_path(e)
  end
end
