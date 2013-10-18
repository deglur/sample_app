# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# SampleApp::Application.config.secret_token = 'c8010758c2a92291f349f037da13052b0dc918848adec3cd306d73c80e73f875903c83bea920c1d24e4a5d7d4e961c2816fdfde75f4dd886b8a11f6f23c225a7'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in the token file
		token  = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end
SampleApp::Application.config.secret_key_base = secure_token
