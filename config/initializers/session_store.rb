# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_CrombyAM_session',
  :secret      => 'e4e2538d4ebcf96ca3610ed2708cdc7d6d5dc4a2e8df856add1e6a563a2d7bb5cad14375e44e255ee26e84e7b0b3f3f9f98afce19c67f6dac5682eae2097de6c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
