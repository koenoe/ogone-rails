require 'digest'

require 'ogone/version'
require 'ogone/helpers'
require 'ogone/base'

module Ogone
  extend self

  def status(code)
    code = code.to_i

    description = 'unknown'
    unless Ogone::statuses[code].blank?
      description = Ogone::statuses[code]
    end
    description
  end

end