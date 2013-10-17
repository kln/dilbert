$:.unshift File.dirname(__FILE__)
require 'mongoid'
Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")

class Ticket
  include Mongoid::Document
  field :level, type: Integer
  has_many :tags
  has_one :place
end

class Tag
  include Mongoid::Document
  field :tag_name, type: String
  belongs_to :ticket
end

class Place
  include Mongoid::Document
  field :place_code, type: Integer
  field :place_description, type: String
  belongs_to :ticket
end
