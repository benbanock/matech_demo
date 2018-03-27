class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(project)
    @project = project
    mail(to: project.client_email, cc: @project.users.first.email, subject: "Temp access to your Matech project \"#{project.name}\"")
  end
end
