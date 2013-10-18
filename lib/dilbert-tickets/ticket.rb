$:.unshift File.dirname(__FILE__)
require 'mongoid'
Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml")

class Ticket
  include Mongoid::Document
  field :level, type: Integer
  field :created_at, type: Time
  has_and_belongs_to_many :tags
  belongs_to :place
end

class Tag
  include Mongoid::Document
  field :tag_name, type: String
  has_and_belongs_to_many :ticket
end

class Place
  include Mongoid::Document
  field :place_code, type: Integer
  field :place_description, type: String
  has_many :ticket
  validates_uniqueness_of :place_description
  validates_uniqueness_of :place_code
end
