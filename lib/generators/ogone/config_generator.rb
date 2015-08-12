require "rails/generators/base"

module Ogone
  module Generators
    class ConfigGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      def copy_files
        copy_file "ogone.yml", "config/ogone.yml"
        copy_file "ogone.rb", "config/initializers/ogone.rb"
      end
    end
  end
end