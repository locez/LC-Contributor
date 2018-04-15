Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, 
        Rails.configuration.app['GITHUB_KEY'], 
        Rails.configuration.app['GITHUB_SECRET'],
        scope: "user"
end
