class Cli
	def start

		puts "helloooo,how are you?"
		interact
		# "kanjar"
 	end
 	def interact
 		selection= nil
 		while selection!= "bye"
 			    puts "Enter a keyword to search qoutes for"
    		    puts "Enter popular search for popular qoutes by likes"
    		    puts  "          OR                 "
    		    puts "TYPE bye to exit ;-;"
		 		selection= gets.strip.downcase
		 		case selection
		 		    when "popular"
		 		    	 puts "popular qoutes" 
		 		    	 #popular quote interface
		 		    	  
		 		    	   
						   
						  
		 			      #store query
		 			      #determine and  execute the response
		 			      
		 			when "bye"
		 				 puts "comeback soon! (^-^)"
		 			else
		 			 #scrape_and_display_keywords_list 	
		 			 	 		
		 					
		 		end
 	     end

 	 end

end
