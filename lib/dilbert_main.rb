$:.unshift File.dirname(__FILE__)
require 'trollop'
require 'pry'
load 'ticket.rb'

opts = Trollop::options do
  opt :level, "Level of complexity.", short: '-l', default: 1, type: :integer
  opt :place, "Place where the ticket is attended.", short: '-p', type: :integer
  opt :tags, "Tags to identify this ticket in the future.", short: '-t', type: :strings
  opt :list_places, "List places."
  opt :add_place, "Add a new place", short: '-a', type: :strings
  opt :drop_place, "Remove a place", type: :integer
end

if opts[:list_places]
  Places.all.find_all.each do |place|
    puts "#{place[:place_code]}: #{place[:place_description]}"
  end
  exit
end

unless opts[:add_place].nil?
  Places.find_or_create_by(
    place_description: opts[:add_place],
    place_code: Places.last[:place_code] + 1
    )
  exit
end

unless opts[:drop_place].nil?
  Places.where(place_code: opts[:drop_place]).delete
  exit
end

if opts[:place].nil?
  puts "You must inform a place!"
  exit
end

ticket = Ticket.new
ticket.level = opts[:level]
ticket.place = opts[:place]
ticket.save!

unless opts[:tags].nil?
  opts[:tags].each { |tag| ticket.tags.create(tag_name: tag) }
  ticket.save!
end

binding.pry