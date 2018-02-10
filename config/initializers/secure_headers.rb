SecureHeaders::Configuration.default do |config|
  config.hsts = "max-age=#{1.day.to_i}; includeSubDomains"
  config.x_frame_options = 'SAMEORIGIN'
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection = '1; mode=block'
  config.x_download_options = 'noopen'
  config.x_permitted_cross_domain_policies = 'none'
  config.csp = {
    default_src: %w('self'),
    frame_src: %w('self'), # deprecated in CSP 2.0
    child_src: %w('self'), # CSP 2.0 only; replaces frame_src
    form_action: %w('self'), # CSP 2.0 only
    block_all_mixed_content: true, # CSP 2.0 only
    connect_src: %w('self'),
    font_src: %w('self' data:),
    img_src: %w('self' data:),
    media_src: %w('self'),
    object_src: %w('none'),
    script_src: %w('self' *.newrelic.com *.nr-data.net),
    style_src: %w('self'),
    base_uri: %w('self')
  }
end
