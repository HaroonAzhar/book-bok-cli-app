require 'pry'
class Quote
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author, :author_link,:author_name
	attr_writer  
    
	def initialize(cont,likes,book,author=nil)
		@content=cont
		@likes=likes
		@scripture_it_belongs_to=book
		@author=author

	end

	def intructions
		
		puts " enter next to load more qoutes "
		puts " else "
 	end

    def view_n_quote_info(list,n)
		puts list[n].content
		puts list[n].likes
		puts list[n].scripture_it_belongs_to
		puts list[n].author_name
		# ask to go in details of author
		
     end
	
	def determine_and_execute_response(input,list)
         input=input.to_i==0? input : input.to_i
         case input
         when 1..list.length
         	view_n_quote_info(list,input-1)
         when "more"
         	#method or more
         else
         	puts "I don't understand (@ - @) "
         end

		
	end


	

    def self.popular_quote_interface
    	#qoute_of_the_day
    	# puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    	# puts "Qoutes of the day"
    	# puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        #scarpe_and_display_pouplar_list
		#display instruction for popular qoutes
		list=self.scrape_and_display_popular_list
		loop do
		 	  puts "Enter the place number of the qoute positioned in the list, that you want to know more about"
	          puts " enter 'more' to view more popular quotes"
	          puts " enter done to stop viewing qoutes, if you're done for the day  oor back"
	          option=gets.strip.downcase
	          break if option=="done"
	          determine_and_execute_response(input,list)
		 
		 end


        selection=nil
        while selection!="exit"
    		puts "Enter a keyword to search qoutes for"
    		puts "Enter popular search for popular qoutes by likes"
    		puts "Enter exit to quit searching for qoutes"
    		selection=gets.strip.downcase
    		case selection
    			when "popular"
    				  
    				  list=quote_info_selection_instructions
    				  
    				  	quote_info_selection_instructions
    				     opt=gets.strip
    				      n=opt/10
    				      opt=opt%10
    				    if opt==1
    				   	 #qoute_list[n]'s more info
    				   	else
    				   	 #find_or_create_author	
    				   	end
    				  	
    				   puts "press any key to continue"
    				   gets.strip
    				   



    				  #set instructions

    			when  "exit" 
    		           break  	 
    			else 
    				self.scrape_and_display_keywords_list(selection)
    				## scrape keywords
    				#set instructions
    		end
    		#second selection 1 author or more info
    	end
    end

	def self.scrape_popular_list
		
		page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1"))
		list=scrape_quote_lists_from_doc(page)
		display_list(list)
		
			  
             #Quote.scrape_popular_list
             		#? quote.css("a[href^='/work']")[0]['href']:  quote.css("a[href^='/work']")[0]['href']
			#scrapes the gref for author and then calls create_with_link
			#Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1")).css("div.quote").css("a.authorOrTitle")["href"]

		
		
	end

	# def self.test
	# 	page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1"))
	# 	quote_list=page.css("div.quoteDetails")
	# 	quote_list.each_with_index do |quote,index|
	# 		puts "-------------------------------------------"
			
	# 		 puts 
			

	# 	end
	# end
	
	def scrape_quote_lists_from_doc(doc)
		quotes=[]
		quote_list=doc.css("div.quoteDetails")
		quote_list.each_with_index do |quote,index|
			
			q=Quote.new(
				quote.css(".quoteText").text,
				quote.css("a[title='View this quote']").text,
				quote.css("a[href^='/work']").empty? ?   quote.css("a[href^='/work']") :  quote.css("a[href^='/work']")[0]['href'])
			    q.author_link= quote.css("a[href^='/author']")[0]['href']
                 
               quotes<<q
               
               

			  puts q.content
			  puts q.likes
			  puts "SCRIPTURE :::: #{q.scripture_it_belongs_to}"
			  puts  " AUTHO_LINK ::::: #{q.author_link}"
			  puts "weeeeeeeeeeeeeeeeeeeeeeeeeeeeeee--------------------------------------------------------------------------------"
			 end 
		
	end
	def display_list(list)
		list.each do |item|
        	puts item.content
			puts item.likes
			puts item.scripture_it_belongs_to
			puts item.author_name
		end
		#displayed qoute 
		
			
	end
	def self.phrase_to_search_string(phrase)
		words=phrase.split(' ')
		str=words.join('+')
		search_string="https://www.goodreads.com/quotes/search?utf8=%E2%9C%93&q=#{str}&commit=Search"
	end

	
		
        
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number 
	
	def self.scrape_and_display_keywords_list(phrase)
		page=Nokogiri::HTML(open(phrase_to_search_string))
		list=scrape_quote_lists_from_doc(page)
		display_list(list)



		#displayed qoute content
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number 
	end

	
	
end