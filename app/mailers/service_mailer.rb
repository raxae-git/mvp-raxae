class ServiceMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.new.subject
  #

  def new_service(title)
    @title = title
    mail to: 'example@teste.com', subject: "Novo Serviço #{@title}"
  end
end
