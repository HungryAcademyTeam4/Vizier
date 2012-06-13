class Event < ActiveRecord::Base
  attr_accessible :kind

  def self.today
    Event.find(:conditions => ["created_at > ?", DateTime.now.beginning_of_day)
  end

  def self.messages
    where(type: 'message')
  end

  def self.files
    where(type: 'file')
  end

  def self.get_count(type = :all, today = false)
    events = today ? Event.all : Event.today
    if type == :file
      events = events.files
    elsif type == :message
      events = events.messgaes
    end
    events.count
  end
end
