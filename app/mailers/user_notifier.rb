class UserNotifier < ApplicationMailer
  def send_confirmation_email
    @email1 = InstructorApp.last.pluck(:email)
    @first_name = InstructorApp.last.pluck(:first_name)
    @last_name = InstructorApp.last.pluck(:last_name)
    mail (
      to: @email1,
      from: 'us@quirk.com',
      subject: 'Thank you for applying! Your application has been received.'
    )
  end
  def send_accepted_email
    @email2 = InstructorApp.where(workflow_state: accepted).last.pluck(:email)
    @first_name2 = InstructorApp.where(workflow_state: accepted).last.pluck(:first_name)
    @last_name2 = InstructorApp.where(workflow_state: accepted).last.pluck(:last_name)
    mail (
      to: @email2,
      from: 'us@quirk.com',
      subject: 'Congratulations! Your application has been accepted!'
    )
  end
  def send_scheduling_2us
    @email3 = #email from form user account
    @datetime = #info from form
    @activity = #info from form
    @first_name3 = #fname from form user account
    @last_name3 = #lname from form user account
    @instructor
    mail (
      to: ['zoe.henry@yale.edu', 'ellis.burgoonmiskell@yale.edu', 'sharon.welch@yale.edu'],
      from: 'quirkscheduling@quirk.com',
      subject: 'Someone wants to schedule an activity.'
    )
  end
  def send_appointment_email
    mail (
      to: #instructor.email & user.email,
      from: 'us@quirk.com',
      subject: 'Your activity has been scheduled!'
    )
  end
end
