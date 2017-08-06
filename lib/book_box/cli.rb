class Cli
	def start

		puts "helloooo,how are you?"
		interact
		# "kanjar"
 	end
 	def interact
 		selection= nil
 		while selection!= "bye"
		 		puts  "press 1 to search for Qoutes"
		 		puts  "          OR                 "
		 		puts  "TYPE bye to exit ;-;"
		 		selection= gets.strip.downcase
		 		case selection
		 		    when "1"
		 		    	 puts "books interface"
		 			
		 			when "bye"
		 				 puts "comeback soon! (^-^)"
		 			else
		 			 puts "I don't understand (@ - @) "	 		
		 					
		 		end
 	     end

 	 end

end
