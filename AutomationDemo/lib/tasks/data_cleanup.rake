# frozen_string_literal: true

# Define a constant for the user inactivity threshold
USER_INACTIVITY_THRESHOLD = 1.year.ago.freeze

namespace :app do
  desc "Deletes old inactive user accounts older than 1 year"
  task clean_old_users: :environment do
    puts "Starting cleanup of old users..."
    # Use the defined constant for the inactivity threshold
    count = User.where("last_active_at < ?", USER_INACTIVITY_THRESHOLD).destroy_all
    puts "Deleted #{count} old user(s)."
    puts "Cleanup complete!"
  end
end
