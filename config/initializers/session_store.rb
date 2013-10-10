# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pelit_session',
  :secret      => '8acc4567befdd53e349733576a6ee9941fea82ecfc57296db2e056b3355e3e4582a22c6100a9002771e16cd26f7adfb8a87905886055586b20781a90d1ee6b9b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
