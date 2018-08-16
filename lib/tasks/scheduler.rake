#desc "This task would be called by the Heroku scheduler add on "
task :grab_twitts => :environment do
	puts "Grabbing tweets for all keywords in feed"
	Keyword.grab_all_twitts
	puts "Done with scheduled Keyword.grab_all_twitts "
end
