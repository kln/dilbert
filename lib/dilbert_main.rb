$:.unshift File.dirname(__FILE__)
require 'trollop'
load 'ticket.rb'

opts = Trollop::options do
  opt :level, "Level of complexity.", short: '-l', default: 1, type: :integer
  opt :place, "Place where the ticket is attended.", short: '-p', type: :integer
  opt :tags, "Tags to identify this ticket in the future.", short: '-t', type: :strings
end

puts "You must inform a place!" and exit if opts[:place].nil?

ticket = Ticket.new
ticket.level = opts[:level]
ticket.place = opts[:place]
ticket.save!

unless opts[:tags].nil?
  opts[:tags].each { |tag| ticket.tags.create(tag_name: tag) }
  ticket.save!
end


