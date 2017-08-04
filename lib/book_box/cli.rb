class Cli
	def start

		puts "helloooo,how are you?"
		interact
		# "kanjar"
 	end
 	def interact
 		selection= nil
 		while selection!= "bye"
		 		puts  "press 1 to search for Books"
		 		puts  "press 2 to search for Authors"
		 		puts  "press 3 to search for Qoutes"
		 		puts  "          OR                 "
		 		puts  "TYPE bye to exit ;-;"
		 		selection= gets.strip.downcase
		 		case selection
		 		    when "1"
		 		    	 puts "books interface"
		 			when "2"
		 				 puts "auhthor interface"
		 			when "3"
		 			 	  Qoute.qoute_interface
		 			when "bye"
		 				 puts "comeback soon! ^-^ "		
		 					
		 		end
 	     end

 	 end

end
