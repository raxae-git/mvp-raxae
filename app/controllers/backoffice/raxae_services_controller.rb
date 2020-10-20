class Backoffice::RaxaeServicesController < BackofficeController
  before_action :set_service, only: %i[show edit update destroy]

  def index
    @services = Service.all
  end

  def show; end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def params_service
    params.require(:raxae_services).permit(:title, :kind, :description, :value)
  end
end
