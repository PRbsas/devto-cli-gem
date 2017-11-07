class DevTo::CLI

  def call
    DevTo::Scraper.new.make_posts
    puts "< Welcome to your DEV Community FEED >"
    puts
    list_posts
    start
  end

  def list_posts
    DevTo::Post.all.each.with_index(1) do |post, i|
      puts "#{i}. #{post.title} - #{post.author}"
    end
  end

  def start
    input = nil
    while input != "exit"
      puts
      puts "Choose a post NUMBER to read it"
      puts
      puts "Type LIST to see the posts again"
      puts "Type EXIT to end program"

      input = gets.strip.downcase
      if input == "list"
        list_posts
      elsif input.to_i.between?(1, DevTo::Post.all.size)
        #find Post by number and show details, content
        post = DevTo::Post.find(input) # and print
        puts "#{post.title}"
      end
    end
    puts "See you soon for more DEV Posts"
  end
end
