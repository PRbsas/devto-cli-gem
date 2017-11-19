class DevTo::Post
  attr_accessor :title, :author, :tags, :url, :comments, :likes, :date, :content

  @@all = []

  def initialize(attributes_hash)
    attributes_hash.each {|attribute, value| self.send(("#{attribute}="), value)}
    self.class.all << self
  end

  def add_post_attributes(attributes_hash)
    attributes_hash.each {|attribute, value| self.send(("#{attribute}="), value)}
  end

  def self.find(id)
    self.all[id.to_i-1]
  end

  def self.all
    @@all
  end
end
