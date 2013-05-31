class RegisterMailer < ActionMailer::Base
  default from: "info@shinescrum.com"

  def registration_confirmation(register)
    @register = register
    @course = @register.course
    subject = I18n.t("mailer.registration.confirmation.subject")

    mail(to: "#{register.name} <#{register.email}>",
         subject: "#{@course.name} #{subject}")
  end

  def registration_admin_notification(register)
    @register = register
    @course = @register.course
    locale = I18n.locale
    set_locale :zh
    subject = I18n.t("mailer.registration.admin_notification.subject")

    mail(to: "Daisy.Guo@shinetechchina.com, jim.wang@shinetechchina.com",
         subject: subject)
    set_locale locale
  end

  private

  def set_locale(locale)
    I18n.locale = locale
  end
end
