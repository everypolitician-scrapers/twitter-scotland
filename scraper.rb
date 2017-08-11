#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'scraperwiki'
require 'twitter_list'

abort "Need to set ENV['MORPH_TWITTER_TOKENS']" unless ENV.key? 'MORPH_TWITTER_TOKENS'
twitter_list = TwitterList::Scraper.new(twitter_tokens: ENV['MORPH_TWITTER_TOKENS'])

data = twitter_list.people('ScotParl', 'msps-session-5')
warn data
ScraperWiki.save_sqlite([:id], data)
