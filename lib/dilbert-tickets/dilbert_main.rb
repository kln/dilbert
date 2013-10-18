$:.unshift File.dirname(__FILE__)
require 'trollop'
require 'dilbert_module'

include Dilbert

opts = Trollop::options do
  opt :level, "Level of complexity.", short: '-l', default: 1, type: :integer
  opt :place, "Place where the ticket is attended.", short: '-p', type: :integer
  opt :tags, "Tags to identify this ticket in the future.", short: '-t', type: :strings
  opt :list_places, "List places."
  opt :add_place, "Add a new place", short: '-a', type: :strings
  opt :drop_place, "Remove a place", type: :integer
end

if opts[:add_place]
  create_place opts[:add_place]
  exit
end

if opts[:drop_place]
  remove_place opts[:drop_place]
  exit
end

if opts[:list_places]
  list_places
  exit
end

create_ticket opts


