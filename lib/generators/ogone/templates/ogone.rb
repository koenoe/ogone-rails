Rails.application.config.ogone = YAML.load_file('config/ogone.yml')[Rails.env].symbolize_keys