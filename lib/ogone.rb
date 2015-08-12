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
      0: 'Ongeldig of onvolledig',
      1: 'Geannuleerd door de klant',
      2: 'Autorisatie geweigerd',
      4: 'Opgeslagen bestelling',
      40: '',
      41: 'Waiting client payment',
      5': Geautoriseerd',
      50: '',
      51: 'Autorisatie pending',
      52: 'Autorisatie onzeker',
      55: 'Stand-by',
      56: 'OK met geplande betalingen',
      57: '',
      59: 'Manueel te bekomen autorisatie',
      6: 'Geautoriseerd en geannuleerd',
      61: 'Annul. autor. pending',
      62: 'Annul. autor. onzeker',
      63: 'Annul. autor. geweigerd',
      64: 'Geautoriseerd en geannuleerd',
      7: 'Betaling geannuleerd',
      71: 'Annul.betaling pending',
      72: 'Annul. betaling onzeker',
      73: 'Annul betaling geweigerd',
      74: 'Betaling geannuleerd',
      75: 'Annul. betaling verwerkt door merch',
      8: 'Terugbetaald',
      81: 'Terugbetaling pending',
      82: 'Terugbetaling onzeker',
      83: 'Terugbetaling geweigerd',
      84: 'Terugbetaald',
      85: 'Terugbet. verwerkt door merchant',
      9: 'Betaling aangevraagd',
      91: 'Betaling pending',
      92: 'Betaling onzeker',
      93: 'Betaling geweigerd',
      94: 'Terugbet. geweigerd door de bank',
      95: 'Betaling verwerkt door merchant',
      96: '',
      99: 'Wordt verwerkt'
    }
  end

  def status(code)
    code = code.to_i

    description = 'Onbekend'
    if Ogone::statuses[code]
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