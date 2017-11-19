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
      post.title = data.search(".content h3 span").remove
      post.title = data.search(".content h3").text.strip.gsub(/[[:space:]]+/," ")
      post.author = data.search("h4").text.strip
      post.tags = data.search(".tags .tag").collect { |tag| tag.text.strip}
      post.url = "https://dev.to" + data.search("a").last.attr("href")
      post.comments = data.search(".engagement-count-number").first.text.strip
      post.likes = data.search(".engagement-count-number").last.text.strip
    end
  end

  def make_content(current_post)
    post_page = Nokogiri::HTML(open("#{current_post.url}"))
    current_post.content = post_page.search("body #article-body").text.strip
    current_post.date = post_page.search("#main-title .published-at").text.strip
  end
end
