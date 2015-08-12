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

  def statuses
    {
      0 => 'invalid',
      1 => 'canceled',
      2 => 'refused',
      4 => 'saved_order',
      40 => '',
      41 => 'waiting',
      5 => 'authorized',
      50 => '',
      51 => 'authorisation_pending',
      52 => 'authorisation_unsure',
      55 => 'standby',
      56 => 'planned',
      57 => '',
      59 => 'manual_authorisation',
      6 => 'authorized_canceled',
      61 => 'authorized_canceled_pending',
      62 => 'authorized_canceled_unsure',
      63 => 'authorized_canceled_refused',
      64 => 'authorized_canceled',
      7 => 'payment_canceled',
      71 => 'payment_canceled_pending',
      72 => 'payment_canceled_unsure',
      73 => 'payment_canceled_refused',
      74 => 'payment_canceled',
      75 => 'payment_canceled_processed',
      8 => 'refunded',
      81 => 'refunded_pending',
      82 => 'refunded_unsure',
      83 => 'refunded_refused',
      84 => 'refunded',
      85 => 'refunded_processed',
      9 => 'payment_accepted',
      91 => 'payment_accepted_pending',
      92 => 'payment_accepted_unsure',
      93 => 'payment_accepted_refused',
      94 => 'payment_accepted_refunded_refused',
      95 => 'payment_accepted_processed',
      96 => '',
      99 => 'processing'
    }
  end

  def status(code)
    code = code.to_i

    description = 'unknown'
    unless Ogone::statuses[code].blank?
      description = Ogone::statuses[code]
    end
    description
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