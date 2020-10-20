class Backoffice::RaxaeServicesController < BackofficeController
  before_action :set_service, only: %i[show edit update destroy]

  def index
    @services = Service.all
  end

  def show; end

  def new
    @service = Service.new
  end

  def edit; end

  def create
    @service = Service.new(params_service)
    if @service.save!
      redirect_to backoffice_raxae_services_path
    else
      render :index
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def params_service
    params.require(:service).permit(:title, :kind, :description, :value)
  end
end
