module ApplicationHelper
    def is_rtl?
        ApplicationController::RIGHT_TO_LEFT_LANGUAGES.include?(I18n.locale.to_s)
    end
end
