# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lawflow_session',
  :secret      => '7b2a5c91f5db7c731fe750b289cfebb1b95a4d57ddc85bb6608775e9a2f4b972147e9d43eb7cb858b4638ecd018909056b90ab9cffcbbc8473a37bde22e6a44d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
