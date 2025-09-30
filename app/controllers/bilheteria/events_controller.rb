class Bilheteria::EventsController < Bilheteria::ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Ticketing::Event.order(:start_on)

    # busca simples
    if params[:search].present?
      term = "%#{params[:search]}%"
      @events = @events.where("name ILIKE ? OR venue ILIKE ?", term, term)
    end
  end

  def show; end

  def new
    @event = Ticketing::Event.new
  end

  def create
    @event = Ticketing::Event.new(event_params)
    if @event.save
      redirect_to [:bilheteria, @event], notice: "Evento criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to [:bilheteria, @event], notice: "Evento atualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to bilheteria_events_path, notice: "Evento removido."
  end

  private

  def set_event
    @event = Ticketing::Event.find(params[:id])
  end

  def event_params
    params.require(:ticketing_event).permit(
      :name, :description, :venue, :start_on, :end_on, :status
    )
  end
end
