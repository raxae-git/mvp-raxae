class LeadMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.confirmation.subject
  #
  before_action :load_lead

  def confirmation
    mail to: 'example@teste.com', subject: "lead Confirmation of #{@lead.name}"
  end

  private

  def load_lead
    @lead = params[:lead]
  end
end
