Recaptcha.configure do |config|
  # localhost
  config.public_key  = '6LcjCdYSAAAAADcRQqsLSF2-Jw7dDghBforoA9Sp'
  config.private_key = '6LcjCdYSAAAAAL-y1PK4HX70f85MzLyZhxfbgtWs'
  config.skip_verify_env = 'test'
  config.proxy = 'http://myproxy.com.au:8080'
  #config.proxy = 'http://10.1.0.41:8080' if Rails.env == 'production'
end