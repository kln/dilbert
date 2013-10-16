$:.unshift File.dirname(__FILE__)
require 'mongoid'
Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")

class Ticket
  include Mongoid::Document
  field :level, type: Integer
  field :place, type: Integer
  embeds_many :tags
end

class Tag
  include Mongoid::Document
  field :tag_name, type: String
  embedded_in :ticket
end
