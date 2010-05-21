# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_layer_app_session',
  :secret      => '18f695e0a20aa478f85b390508ab23ce8f5dfcbcdbbc542f4014374d2470d7bc29bfb3bdaa5ab2f868b4a12f84e8bd879314edb9e9158567afbf3d77485d2cc2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
