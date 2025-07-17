class SendWelcomeEmailJob < ApplicationJob
  queue_as :default # Or a specific queue like :emails

  def perform(user_id)
    user = User.find_by(id: user_id)
    if user
      # Simulate sending an email
      puts "Sending welcome email to #{user.email}..."
      # UserMailer.welcome_email(user).deliver_now # In a real app
      sleep(2) # Simulate work
      puts "Welcome email sent to #{user.email}!"
    else
      puts "User with ID #{user_id} not found, skipping email."
    end
  rescue => e
    # Basic error handling in job (more robust in real app)
    puts "Error sending email for user ID #{user_id}: #{e.message}"
    raise # Re-raise to allow queue adapter's retry mechanism
  end
end