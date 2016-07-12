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

  def send_rejected_email
    @email4 = InstructorApp.where(workflow_state: rejected).last.pluck(:email)
    @first_name4 = InstructorApp.where(workflow_state: rejected).last.pluck(:first_name)
    @last_name4 = InstructorApp.where(workflow_state: rejected).last.pluck(:last_name)
    mail (
      to: @email4,
      from: 'us@quirk.com',
      subject: 'Instructor Application at Quirk'
    )
  end

  def send_scheduling_2us
    @schedule = Schedule.last
    @email3 = User.where(id: @schedule.user_id).pluck(:email)
    #info from form
    @possible_start_1 = @schedule.possible_start_1
    @possible_end_1 = @schedule.possible_end_1
    @possible_start_2 = @schedule.possible_start_2
    @possible_end_2 = @schedule.possible_end_2
    @possible_start_3 = @schedule.possible_start_3
    @possible_end_3 = @schedule.possible_end_3
    @activity = Activity.where(id: @schedule.activity_id).pluck(:title)
    @first_name3 = User.where(id: @schedule.user_id).pluck(:first_name)
    @last_name3 = User.where(id: @schedule.user_id).pluck(:last_name)
    @instructoremail = Instructor.where(id: @schedule.instructor_id).pluck(:email)
    @instructor_firstname = Instructor.where(id: @schedule.instructor_id).pluck(:first_name)
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
