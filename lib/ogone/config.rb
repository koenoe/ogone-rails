module Ogone

  extend self

  module Config

    @currency = 'EUR'
    @language = 'nl_NL'
    @mode = nil
    @psp_id = nil
    @sha_in = nil
    @accept_url = nil
    @cancel_url = nil
    @decline_url = nil
    @exception_url = nil

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

    def parse_config(yml)
      yml.each do |key, value|
        case key
        when :psp_id
          @psp_id = value
        when :sha_in
          @sha_in = value
        when :accept_url
          @accept_url = value
        when :cancel_url
          @cancel_url = value
        when :decline_url
          @decline_url = value
        when :exception_url
          @exception_url = value
        when :currency
          @currency = value unless value.nil?
        when :language
          @language = value unless value.nil?
        when :mode
          @mode = value unless value.nil?
        end
      end
    end

    def post_url
      "https://secure.ogone.com/ncol/#{mode}/orderstandard.asp"
    end

    def psp_id
      @psp_id
    end
    def sha_in
      @sha_in
    end
    def language
      @language
    end
    def currency
      @currency
    end
    def mode
      @mode
    end
    def accept_url
      @accept_url
    end
    def cancel_url
      @cancel_url
    end
    def decline_url
      @decline_url
    end
    def exception_url
      @exception_url
    end

  end
end