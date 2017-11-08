class PurchaseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_mailer.confirm_purchase.subject
  #
  def confirm_purchase(email, item, total)
	@email = email
	@item = item
	@total = total
	mail(to: ENV.fetch('MY_EMAIL'), subject: "Purchase confirmation for #{@item}")
  end
end
