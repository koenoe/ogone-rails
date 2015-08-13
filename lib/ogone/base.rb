module Ogone

  extend self

  class Base

    attr_reader :params

    def initialize
      @params = {}

      add_param('psp_id', Ogone::psp_id)
      add_param('language', Ogone::language)
      add_param('currency', Ogone::currency)
      add_param('accept_url', Ogone::accept_url)
      add_param('cancel_url', Ogone::cancel_url)
      add_param('decline_url', Ogone::decline_url)
      add_param('exception_url', Ogone::exception_url)
    end

    def add_param(key, value)

      value = (value * 100) if key == 'order_amount'

      if Ogone::fields[key.to_sym].present?
        key = Ogone::fields[key.to_sym]
      end

      @params[key.upcase] = value
    end

    def generate_sha
      sha = ''
      @params.sort.each do |key, value|
        sha << "#{key}=#{value}#{Ogone::sha_in}"
      end
      Digest::SHA1.hexdigest(sha).upcase
    end

  end

end