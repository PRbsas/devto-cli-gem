class DevTo::CLI

  def call
    DevTo::Scraper.new.make_posts
    puts
    puts "< Welcome to your DEV Community FEED >".colorize(:color => :light_white, :background => :red)
    puts
    list_posts
    start
  end

  def list_posts
    DevTo::Post.all.each.with_index(1) do |post, i|
      puts
      puts "#{i}. #{post.title} - #{post.author}"
      puts " -------- #{post.tags.join(" · ")}     \u{1F4AC} #{post.comments}  \u{2764} #{post.likes}"
    end
  end

  def print_post(post)
    puts
    puts
    puts "#{post.title}".colorize(:color => :light_white, :background => :red)
    puts " ---- #{post.author}"
    puts
    puts "#{post.content}"
    puts
    puts " ---- #{post.tags.join(" · ")}     \u{1F4AC} #{post.comments}  \u{2764} #{post.likes}"
    puts " ---- #{post.url}"
    puts
  end

  def start
    input = nil
    post = nil
    while input != "exit"
      puts
      puts "< Type post NUMBER to read it >"
      puts "< Type LIST to see the posts again >"
      puts "< Type EXIT to end program >"

      input = gets.strip.downcase
      if input == "list"
        list_posts
      elsif input.to_i.between?(1, DevTo::Post.all.size)
        post = DevTo::Post.find(input)
        print_post(post)
        puts "< Type OPEN to see it in the browser >"
        post
      elsif input.to_i > DevTo::Post.all.size
        puts
        puts " -------- Please select a valid option:"
      elsif input == "open" && post != nil
          system("open #{post.url}")
      end
    end
    puts " -------- See you soon for more DEV Posts"
  end
end
