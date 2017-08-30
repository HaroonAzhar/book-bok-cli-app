class Cli
	def start
        puts "~~~~~~~~~~~~~~~~~~~~~~"
		puts "Hello,how are you today?"
		puts "~~~~~~~~~~~~~~~~~~~~~~"
		self.class.interact
 	end



 	


 	 private

 	 	def self.interact
 		selection= nil
 		while selection!= "bye"
 			    Scrapper.curr_pg=1
 			    
 			    puts "\nEnter a 'keyword' to search qoutes for"
    		    puts "\nEnter 'popular' to view popular qoutes "
    		    puts  "\n    ^^      OR  ^^                "
    		    puts "\nTYPE bye to exit ;-;"
		 		selection= gets.strip.downcase

		 		case selection
		 		    when "popular"
		 		    	 popular_interface
		 		    when "bye"
		 				 puts "comeback soon! (^-^)"
		 			when "keyword"
		 				keyword_interface
		 			else
		 				puts "I don't understand (@ - @) "
		 			 	 		
		 		 end
 	     end

 	 end



 	 def self.display_list(list)
		list.each_with_index do |item,index|
			puts "\n#{index+1})"
           	puts "\n#{item.content}"
			
		end
		
	end	

	def self.respond(input,list)
         input=input.to_i==0? input : input.to_i
         case input
         when 1..list.length
         	list[input-1].display
             what_now?(list[input-1]) 
         when "more"
         	Scrapper.curr_pg+=1
         	self.popular_interface
         else
         	puts "I don't understand (@ - @) "
         end

	 end


	 def self.what_now?(quobj)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	 	puts  "\nEnter 'author' to know more about the author"
	 	puts  "\nOr"
	 	puts  "\nPress enter to reload all the quotes"
	 	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

	 	 ans=gets.strip.downcase
	 	 if ans=="author"  
            quobj.author=Author.create_by_link(quobj.author_link)
            quobj.author.display
            puts "\nPress enter to continue"
            gets.strip

            else 
            	
            end
	 	
	 end




	  def self.popular_interface
	  	list=Scrapper.scrape_popular_list
    	loop do
			  
			  display_list(list)
			  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			  puts "                                 I N S T R U C T I O N S                                        "
		 	  puts "\nEnter the place number of the qoute positioned in the list, that you want to know more about"
	          puts "\nEnter 'more' to view more popular quotes"
	          puts "\nEnter done to stop viewing qoutes, if you're done for the day  or go back to the previous menu"
	          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	          option=gets.strip.downcase
	          break if option=="done"
	          respond(option,list)
		 
		 end
     end


    def self.keyword_interface
    	puts "\nEnter the word you'd like to search qoutes relating to"
    		  keyword=gets.strip.downcase
			  list=Scrapper.scrape_keywords_list(keyword)
    	loop do
    		  
			  display_list(list)
		 	  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			  puts "                                 I N S T R U C T I O N S                                        "
		 	  puts "\nEnter the place number of the qoute positioned in the list, that you want to know more about"
	          puts "\nEnter 'more' to view more popular quotes"
	          puts "\nEnter done to stop viewing qoutes, if you're done for the day  or go back to the previous menu"
	          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	          option=gets.strip.downcase
	          break if option=="done"
	          respond(option,list)
		 
		 end
     end
	

end
