if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJPV2WQ4SQUR4JX7Q '],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['omatveyuk']
  end
end