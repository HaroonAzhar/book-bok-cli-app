class Cli
	def start

		puts "helloooo,how are you?"
		interact
		# "kanjar"
 	end
 	def interact
 		selection= nil
 		while selection!= "bye"
 			    Quote.curr_pg=1
 			    
 			    puts "\nEnter a 'keyword' to search qoutes for"
    		    puts "\nEnter 'popular' to view popular qoutes "
    		    puts  "\n    ^^      OR  ^^                "
    		    puts "\nTYPE bye to exit ;-;"
		 		selection= gets.strip.downcase

		 		case selection
		 		    when "popular"
		 		    	 Quote.popular_interface
		 		    	 puts "popular qoutes" 
		 		    	 #popular quote interface
		 			      #store query
		 			      #determine and  execute the response
		 			      
		 			when "bye"
		 				 puts "comeback soon! (^-^)"
		 			when "keyword"
		 				Quote.keyword_interface
		 			 #scrape_and_display_keywords_list 	
		 			else
		 				puts "I don't understand (@ - @) "
		 			 	 		
		 					
		 		end
 	     end

 	 end

end
