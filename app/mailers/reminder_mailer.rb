class ReminderMailer < ApplicationMailer
  def overdue_email(user, carrier_name, current_location, due_date)
    @user = user
    @first_name = user.full_name
    @carrier_name = carrier_name
    @current_location = current_location
    @due_date = due_date
    mail(to: @user.email, subject: 'Baby Carrier Overdue For Return')
  end
end