JSONAPI.configure do |config|
  config.json_key_format = :camelized_key
  config.route_format = :dasherized_route
  config.default_paginator = :none
  config.default_page_size = 10
  config.maximum_page_size = 100
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count
end
