class Backoffice::RaxaeServicesController < BackofficeController
  def index
    @services = Service.all
  end
end
