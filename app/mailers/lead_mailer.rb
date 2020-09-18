class LeadMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.confirmation.subject
  #
  def confirmation(lead)
    @lead = lead
    mail to: 'example@teste.com', subject: "Dados #{@lead[:name]}"
  end
end
