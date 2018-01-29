class DevTo::CLI

  def call
    DevTo::Scraper.make_posts
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

  def print_post(current_post)
    puts
    puts
    puts "#{current_post.title}".colorize(:color => :light_white, :background => :red)
    puts " ---- #{current_post.author}   ---- #{current_post.date}"
    puts
    puts wrap("#{current_post.content}")
    puts
    puts " ---- #{current_post.tags.join(" · ")}     \u{1F4AC} #{current_post.comments}  \u{2764} #{current_post.likes}"
    puts " ---- #{current_post.url}"
    puts
  end

  def start
    input = nil
    current_post = nil
    while input != "exit"
      puts
      puts "< Type post NUMBER to read it >"
      puts "< Type LIST to see the posts again >"
      puts "< Type EXIT to end program >"

      input = gets.strip.downcase
      if input == "list"
        list_posts
      elsif input.to_i.between?(1, DevTo::Post.all.size)
        current_post = DevTo::Post.find(input)
        current_post.content ? current_post : DevTo::Scraper.make_content(current_post)
        print_post(current_post)
        puts "< Type OPEN to see it in the browser >"
        current_post
      elsif input.to_i > DevTo::Post.all.size
        puts
        puts " -------- Please select a valid option:"
      elsif input == "open" && current_post != nil
          system("open #{current_post.url}")
      end
    end
    puts " -------- See you soon for more DEV Posts"
  end

  def wrap(text, width=78)
	  text.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
  end
end
