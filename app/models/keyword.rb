class Keyword < ApplicationRecord
	def grab_twitts
		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "2lF2l4CsXujzeuWnJOLhCX04p"
			config.consumer_secret     = "6ovgFnUnUenD2PajCwIm79tbGQMPn1K5Yc6KwSyIt5xGY3vGOm"
			config.access_token        = "24200461-8gssFGrtAqRAxywYiEwfmz6yc0nih5ZavEwl4mgAS"
			config.access_token_secret = "P5WccAWp21e6be2L3RtaeLYHeW5CBtCeFTV1LBKLoYDo7"
		end

		client.search(self.word,  :count => 3, :result_type =>  "recent").take(3).collect do |tweet|
			  "#{tweet.user.screen_name}: #{tweet.text}"
	
	end
	
end

end
