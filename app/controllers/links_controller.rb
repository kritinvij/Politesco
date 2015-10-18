class LinksController < ApplicationController
	# require 'httparty'
	# def index
	# 	@links = RedditKit.search 'subreddit:india'
	# end
	def index
		# require 'json'
		# require 'net/http'
		# source = 'https://www.reddit.com/r/india/.json'
		# resp = Net::HTTP.get_response(URI.parse(source))
		# data = resp.body
		# @result = JSON.parse(data)
		require 'httparty'
		response = HTTParty.get('https://www.reddit.com/r/india/.json')
		@result = JSON.parse(response.body)
		@result['data']['children'].each do |child|
		    if (child['data']['link_flair_text'].downcase == "politics")
		    	item = Item.where(:permalink => child['data']['permalink'])
		    	if (item.blank?)
		    		item = Item.create(:thumbnail => child['data']['thumbnail'], :permalink => child['data']['permalink'], :url => child['data']['url'], :title => child['data']['title'], :description => child['data']['selftext'])
				end		
			end
		end

		@all = get_all
	end

	def get_all
		all = Array.new()
		item_row = Item.all
  		all.push(item_row)
		return all
	end
end
