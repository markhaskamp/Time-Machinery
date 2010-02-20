# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_time-machinery_session',
  :secret      => '70ba55c7ed5ffc7df86797f1c0140df12558fe95c8e243503c3bc98861ea5ec58db2c50f13e130cd2e1a39bc26148398f981a64f3fba6ea25d6ec0bf470ede53'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
