# coding: utf-8

require 'twitter'
require 'tweetstream'
require 'pp'

# Define ConsumerKey & Secret + AccessToken & Secret  
ck = 'IQKbtAYlXLripLGPWd0HUA'
cs = 'GgDYlkSvaPxGxC4X8liwpUoqKwwr3lCADbz8A7ADU'
at = ''
ats = ''


# Verify to twitter

$host = Twitter::Client.new(
	:consumer_key		=> ck,
	:consumer_secret	=> cs,
	:oauth_token		=> at,
	:oauth_token_secret	=> ats
)

# Verify to UserStream of twitter
 
TweetStream.configure do |config|
	config.consumer_key		= ck
	config.consumer_secret		= cs
	config.oauth_token		= at
	config.oauth_token_secret	= ats
	config.auth_method		= :oauth
end
 
# Connect to UserStream with TweetStream gem

client = TweetStream::Client.new
 
client.userstream do |status|
	
	# Show home_timeline in CUI

	puts "#{status.user.screen_name}: #{status.text}"

	str = status.text
	usr = status.user.screen_name
	str_user = "@#{usr}" 



	if str =~ /name_update/ && str.start_with?("@69 ") then
		
		puts "requested"
		
		strAry = str.split(" ")
		name = strAry[2]

		$host.update_profile( :name => "#{name}" )
		puts "============== CHANGED NAME. =============="
	end
end # Disconnect to UserStream and unshow home_timeline in CUI
