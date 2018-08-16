class Keyword < ApplicationRecord
	has_many :tweets
	def grab_twitts
		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "2lF2l4CsXujzeuWnJOLhCX04p"
			config.consumer_secret     = "6ovgFnUnUenD2PajCwIm79tbGQMPn1K5Yc6KwSyIt5xGY3vGOm"
			config.access_token        = "24200461-8gssFGrtAqRAxywYiEwfmz6yc0nih5ZavEwl4mgAS"
			config.access_token_secret = "P5WccAWp21e6be2L3RtaeLYHeW5CBtCeFTV1LBKLoYDo7"
		end

		client.search(self.word,  :count => 100, :result_type =>  "recent").take(100).collect do |tweet|
			new_tweet = Tweet.new
			new_tweet.tweet_id = tweet.id.to_s
			new_tweet.tweet_created_at = tweet.created_at	
			new_tweet.text = tweet.text
			new_tweet.user_uid = tweet.user.id
			new_tweet.user_name = tweet.user.name
			new_tweet.user_screen_name = tweet.user.screen_name
			new_tweet.user_image_url = tweet.user.profile_image_url.to_s

			new_tweet.keyword=self
			new_tweet.save
		end
	
	end
	def self.grab_all_twits
		Keyword.all.each do |keyword|
			keyword.grab_twitts
		end
	end

end
