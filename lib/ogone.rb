require 'digest'

require 'ogone/version'
require 'ogone/helpers'
require 'ogone/base'

module Ogone
  extend self

  def fields
    {
      psp_id: 'PSPID',
      accept_url: 'ACCEPTURL',
      cancel_url: 'CANCELURL',
      decline_url: 'DECLINEURL',
      exception_url: 'EXCEPTIONURL',
      currency: 'CURRENCY',
      language: 'LANGUAGE',
      customer_name: 'CN',
      customer_email: 'EMAIL',
      customer_address: 'OWNERADDRESS',
      customer_zipcode: 'OWNERZIP',
      customer_city: 'OWNERTOWN',
      customer_country: 'OWNERCTY',
      order_description: 'COM',
      order_id: 'ORDERID',
      order_amount: 'AMOUNT'
    }
  end

  def post_url
    "https://secure.ogone.com/ncol/#{Rails.application.config.ogone[:mode]}/orderstandard.asp"
  end
  def psp_id
    "#{Rails.application.config.ogone[:psp_id]}"
  end
  def sha_in
    "#{Rails.application.config.ogone[:sha_in]}"
  end
  def language
    "nl_NL"
  end
  def currency
    "EUR"
  end
  def accept_url
    "#{Rails.application.config.ogone[:accept_url]}"
  end
  def cancel_url
    "#{Rails.application.config.ogone[:cancel_url]}"
  end
  def decline_url
    "#{Rails.application.config.ogone[:decline_url]}"
  end
  def exception_url
    "#{Rails.application.config.ogone[:exception_url]}"
  end
end