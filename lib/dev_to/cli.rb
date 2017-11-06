class DevTo::CLI

  def call
    puts "< Welcome to your DEV Community FEED >"
    puts
    list_posts
    start
  end

  def list_posts
    puts "1. The 7 Most Popular DEV Posts from the Past Week" #title
    puts "dev.to staff" #author
    puts "#icymi" #tags 

    puts "2. How to make time to repay your technical debt"
    puts "Blaine Osepchuk"
    puts "#efficiency #quality #management #technicaldeb"
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
      #elsif input.to_i.between?(1, Post.all.size)
        #find Post and show details, content
      end

    end
    puts "See you soon for more DEV Posts"
  end
end
