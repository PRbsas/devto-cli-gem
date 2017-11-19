class DevTo::Scraper

  def get_page
    Nokogiri::HTML(open("https://dev.to/"))
  end

  def make_posts
    posts.each do |post|
      DevTo::Post.new(scrape_posts(post))
    end
  end

  def make_content(current_post)
    post_page = Nokogiri::HTML(open("#{current_post.url}"))
    current_post.add_post_attributes(scrape_content(post_page))
  end

  private
    def posts
      posts ||= get_page.css(".articles-list .substories .single-article")
    end

    def scrape_posts(post)
      {
        :title => post.search(".content h3").text.strip.gsub(/[[:space:]]+/," "),
        :author => post.search("h4").text.strip,
        :tags => post.search(".tags .tag").collect { |tag| tag.text.strip},
        :url => "https://dev.to" + post.search("a").last.attr("href"),
        :comments => post.search(".engagement-count-number").first.text.strip,
        :likes => post.search(".engagement-count-number").last.text.strip,
      }
    end

    def scrape_content(post_page)
      {
        :date => post_page.search("#main-title .published-at").text.strip,
        :content => post_page.search("body #article-body").text.strip
      }
    end
end
