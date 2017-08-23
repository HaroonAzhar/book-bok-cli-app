class Cli
	def start
        puts "~~~~~~~~~~~~~~~~~~~~~~"
		puts "Hello,how are you today?"
		puts "~~~~~~~~~~~~~~~~~~~~~~"
		
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


 	 private
 	 def self.display_list(list)
		list.each_with_index do |item,index|
			puts "\n#{index+1})"
           	puts "\n#{item.content}"
			
		end
		
	end	

	def self.determine_and_execute_response(input,list)
         input=input.to_i==0? input : input.to_i
         case input
         when 1..list.length
         	list[input-1].display
             what_now?(list[input-1]) 
         when "more"
         	@@curr_pg+=1
         	self.popular_interface
         else
         	puts "I don't understand (@ - @) "
         end

	 end

	 
	 def self.what_now?(quobj)
	 	puts "\n Enter 'author' to know more amout author"
	 	puts  "\nOr"
	 	puts  "\nPress enter to reload all the quotes"
	 	 ans=gets.strip.downcase
	 	 if ans=="author"  
            quobj.author=Author.create_by_link(quobj.author_link)
            quobj.author.display
            puts "\nPress enter to continue"
            else 
            	
            end
	 	
	 end




	  def self.popular_interface
    	loop do
			  list=scrape_popular_list
			  display_list(list)
			  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			  puts "                                 I N S T R U C T I O N S                                        "
		 	  puts "\nEnter the place number of the qoute positioned in the list, that you want to know more about"
	          puts "\nEnter 'more' to view more popular quotes"
	          puts "\nEnter done to stop viewing qoutes, if you're done for the day  or go back to the previous menu"
	          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	          option=gets.strip.downcase
	          break if option=="done"
	          determine_and_execute_response(option,list)
		 
		 end
     end


    def self.keyword_interface
    	loop do
    		  puts " askk for a word"
    		  keyword=gets.strip.downcase
			  list=scrape_keywords_list(keyword)
			  display_list(list)
		 	  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			  puts "                                 I N S T R U C T I O N S                                        "
		 	  puts "\nEnter the place number of the qoute positioned in the list, that you want to know more about"
	          puts "\nEnter 'more' to view more popular quotes"
	          puts "\nEnter done to stop viewing qoutes, if you're done for the day  or go back to the previous menu"
	          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	          option=gets.strip.downcase
	          break if option=="done"
	          determine_and_execute_response(option,list)
		 
		 end
     end
	

end
