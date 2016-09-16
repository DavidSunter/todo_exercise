require 'pry'
require 'date'

class Todo
  attr_accessor  :title, :due_date

  @@all = []


  def initialize(title, due_date = Date.today, id =nil)
    @title = title
    @due_date = due_date
    @id = id
    @@all << self
  end

  def self.all
   @@all
  end

  def self.most_recent
   @@all.last
  end

  def self.find_contain (search)
      @@all.select {|k| k.title == search}
      else
        raise ArgumentError, "The Todo doesnt match"
      end
  end

  def self.find_include (search)
      @@all.select {|k| k.title.include? search}
      else
        raise ArgumentError, "The Todo doesnt match"
      end
  end
  def sync
  http.post(){query :title, :due_date, :id}
  puts "Sync has been successful"
  return @id
end
