class DevTo::Post
  attr_accessor :title, :author, :date, :tags, :url, :comments, :likes, :content

  @@all = []

  def initialize
    self.class.all << self
  end

  def self.find(id)
    self.all[id.to_i-1]
  end

  def self.all
    @@all
  end
end
