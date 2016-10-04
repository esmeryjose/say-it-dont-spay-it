class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user

  def self.time_parser(time)
    newt = (time + Time.zone_offset('EST')).to_s.split(" ")
    newt = year_time_parser(newt[0])+"    "+day_time_parser(newt[1])
  end

  def self.day_time_parser(day_time)
    new_time = day_time.split(":")
    if new_time[0].to_i >=12
      new_time[0] = (new_time[0].to_i - 12).to_s
      new_time = new_time.join(":")
      new_time << "PM"
    else
      new_time = new_time.join(":")
      new_time << "AM"
    end
    new_time
  end

  def self.year_time_parser(year_time)
    new_time = year_time.split("-")
    new_time[0],new_time[1],new_time[2] = new_time[1], new_time[2], new_time[0]
    new_time.join("-")
  end

  def self.feed_Organizer
    Post.all.sort { |a,b| b.created_at <=> a.created_at }
  end

end
