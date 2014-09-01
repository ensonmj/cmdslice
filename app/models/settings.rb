class Settings < Settingslogic
  source "#{Rails.root}/config/config.yaml"
  namespace Rails.env
end
