Refinery::Core.configure do |config|
  # Register extra javascript for backend
  config.register_javascript 'refinery/whitepapers/admin/whitepapers.js'

  # Register extra stylesheet for backend (optional options)
  config.register_stylesheet "refinery/whitepapers/admin/whitepapers.css"
end