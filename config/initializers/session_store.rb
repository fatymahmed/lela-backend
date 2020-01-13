
if Rails.env == "production"
    Rails.application.config.session_store :cookie_store,
                                           key: '_authentication_app',
                                           domain: 'https://events-scheduler-api.herokuapp.com/' ##CHANGE THIS TO THE HEROKU APP
  else
    Rails.application.config.session_store :cookie_store, key: '_authentication_app'
  end