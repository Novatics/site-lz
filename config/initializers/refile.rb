# config/initializers/refile.rb

Refile.secret_key = 'e08f66fb5cc387e10f55d5a0ca5fead8d9f04e0d66a40088ae71508e3ad72aa14d63f7066d1c454e1ef7b7f94137a97823d9494e9e3c0811ff26201925d7ea92'

if Rails.env.production? or Rails.env.staging?
	require "refile/backend/s3"

	aws = {
	  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
	  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
	  bucket: ENV['S3_BUCKET']
	}

	Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
	Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
end