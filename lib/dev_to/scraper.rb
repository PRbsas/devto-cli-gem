class DevTo::Scraper

  def get_page
    Nokogiri::HTML(open("https://dev.to/"))
  end

  def get_posts
    self.get_page.css(".articles-list .substories .single-article")
  end

  def make_posts
    self.get_posts.each do |data|
      post = DevTo::Post.new
      post.title = data.search(".content h3").text.strip.gsub("\n", "").strip
      post.author = data.search("h4").text.strip
    end
  end
end
