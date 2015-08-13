module Ogone

  extend self

  module Helpers
    def ogone_form(ogone, button_class = '')

      ogone = Ogone::Base.new unless ogone.is_a?(Ogone::Base)

      buffer = "<form method='post' action='#{Ogone::post_url}' id='form1' name='form1 class='ogone-form'>"
      ogone.params.each do |key, value|
        buffer += "<input type='hidden' name='#{key}' value='#{value}'>"
      end
      buffer += "<input type='hidden' name='SHASIGN' value='#{ogone.generate_sha}'>"
      buffer += "<input type='submit' name='OGONESUBMIT' value='#{I18n.t('ogone.button_label')}' class='#{button_class}'>"
      buffer += "</form>"

      buffer.html_safe
    end

    ActionView::Base.send :include, Helpers
  end
end