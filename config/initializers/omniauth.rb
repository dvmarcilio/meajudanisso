Rails.application.config.middleware.use OmniAuth::Builder do
  provider :heroku, ENV['1e1ab74f-fc44-4124-b78e-ea5442169811'], ENV['5ab96b07-afae-4865-aa09-cf238831da82']
end