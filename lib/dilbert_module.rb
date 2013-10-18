$:.unshift File.dirname(__FILE__)
require 'pry'

module Dilbert

  load 'ticket.rb'

  def create_ticket(params)
    return false unless check_place params[:place]
    ticket = Ticket.create(level: params[:level])
    ticket.place = Place.find_by(place_code: params[:place])
    unless params[:tags].nil?
      params[:tags].each do |tag|
        ticket.tags << Tag.find_or_create_by(tag_name: tag)
      end
    end
    ticket.save!
  end

  def list_tickets
  end

  def count_tickets
  end

  def list_tags(tag_name)
    tags = []
    Tags.all.find_all.each do |tag|
      tags << {tag_name => ticket_ids.count}
    end
    tags
  end


  def check_place(place_code)

    if place_code.nil?
      puts "You must inform a place!"
      return false
    end

    if Place.where(place_code: place_code).empty?
      puts "Select an existing place!"
      return false
    end

    return true
  end

  def create_place(place_description)
    if Place.count == 0
      next_place_code =  1
    else
      next_place_code = Place.last.place_code + 1
    end
    Place.create!(
      place_description: place_description,
      place_code: next_place_code)
  end

  def edit_place(place_code,place_description)
    Place.where(place_code: place_code).update(place_description: place_description)
  end

  def remove_place(place_code)
    Place.where(place_code: place_code).delete
  end

  def list_places
    Place.all.find_all.each do |place|
      puts "#{place.place_code}: #{place.place_description}"
    end
  end

  def list_place(place_code)
    place = Place.find_by(place_code: place_code)
    puts "#{place.place_code}: #{place.place_description}"
  end

end

binding.pry