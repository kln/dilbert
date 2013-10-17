$:.unshift File.dirname(__FILE__)

module Dilbert

  load 'ticket.rb'

  def create_ticket(params)
    return false unless check_place params[:place]
    ticket = Ticket.new
    ticket.level = params[:level]
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

  def list_tags
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

  def include_place(place_code,place_description)
  end

  def remove_place(place_code)
  end

  def list_places
  end

  def list_places(place_code)
  end

end