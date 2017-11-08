# Specifications for the CLI Assessment

Specs:  

- [X] Have a CLI for interfacing with the application  
  The user interacts with the application through the CLI. Getting prompted for input from the start of the program.  

- [X] Pull data from an external source  
  The data the CLI shows is scraped with Nokogiri and open-uri from [dev.to](https://dev.to/)

- [X] Implement both list and detail views  
  When the program runs, the Scraper class gets called with the method #make-posts that instantiates new instances of Post. The CLI method #list-posts then iterates through the instances of Post and prints them for the user.  
  When the user types in a post number to read, the CLI uses the Post #find method to find the Post. It then calls the Scraper method #make-content to scrape the content of the post and prints it for the user with the #print-post method.
