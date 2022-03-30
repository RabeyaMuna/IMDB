Global.configure do |config|
  config.backend :filesystem,
                 environment: Rails.env.to_s,
                 config_directory: Rails.root.join('config/global').to_s
end
