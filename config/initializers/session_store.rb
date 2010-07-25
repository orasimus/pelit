# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pelit_session',
  :secret      => '4240990c6311ba5a7e03265647c3e9d0955ce5bf96aea5b8f173157b3559b9a40d7c311b5e5b7f175fafb4aece1896c32e33e43fc7120a434d8520d712c33be1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
