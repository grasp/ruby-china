# coding: utf-8
RubyChina::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb


  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true
  
  config.eager_load = true

  #this is for unicorn bug, it is ugly, repeat that with initialize
  config.secret_token = '5070365ffe9d3ad7ed04e0ce080fe7ae9da2bd8497297a695118f91519a4c7b26fce69a024a888e768bacf2e376395921b557ea5cc50999b0e1d86993b908225'
  config.secret_key_base = '66ad08589cd561754c8cd659a5a50a3694904f9c455dd2177115697d12d2c27b873222da8646f34c8cf4598a0f108f12c05141d645a3534c9a9a9833f239f397'

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Specifies the header that your server uses for sending files
  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # Use a different logger for distributed setups
  # config.logger = Logger.new("#{Rails.root}/log/#{Rails.env}.log", 'weekly')
  # config.log_level = :info

  # Use a different cache store in production
  config.cache_store = [:dalli_store,"127.0.0.1", {:namespace => "rb-cn", :compression => true}]

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  #config.serve_static_assets = true
   config.serve_static_assets = false
   config.assets.precompile += ['front.css', 'cpanel.css','widnow']  

  # Enable serving of images, stylesheets, and javascripts from an asset server
  config.action_controller.asset_host = Setting.upload_url
  
  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => Setting.domain }
  config.action_mailer.delivery_method   = :postmark
  config.action_mailer.postmark_settings = { :api_key => Setting.email_password }

  # Enable threaded mode
  # config.threadsafe!
  
  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  config.assets.js_compressor  = :uglifier
  config.assets.css_compressor = :scss

end

