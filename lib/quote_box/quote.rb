require 'pry'
class Quote
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author, :author_link,:author_name
	 
    @@curr_pop_pg=1
    @@curr_word_pg=1
	def initialize(cont,likes,book,author_name,author=nil)
		@content=cont
		@likes=likes
		@author_name=author_name
		@scripture_it_belongs_to=book
		@author=author

	end

	

    
	
	


	

    def self.popular_interface
    	loop do
			  list=scrape_popular_list
			  display_list(list)
		 	  puts "Enter the place number of the qoute positioned in the list, that you want to know more about"
	          puts " enter 'more' to view more popular quotes"
	          puts " enter done to stop viewing qoutes, if you're done for the day  or go back to the previous menu"
	          option=gets.strip.downcase
	          break if option=="done"
	          determine_and_execute_response(option,list)
		 
		 end
     end


    def self.keyword_interface
    	loop do
			  list=scrape_popular_list
			  display_list(list)
		 	  puts "Enter the place number of the qoute positioned in the list, that you want to know more about"
	          puts " enter 'more' to view more popular quotes"
	          puts " enter done to stop viewing qoutes, if you're done for the day  or go back to the previous menu"
	          option=gets.strip.downcase
	          break if option=="done"
	          determine_and_execute_response(option,list)
		 
		 end
     end


    
   
	
	# def self.test
	# 	page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1"))
	# 	quote_list=page.css("div.quoteDetails")
	# 	quote_list.each_with_index do |quote,index|
	# 		puts "-------------------------------------------"
			
	# 		 puts 
			

	# 	end
	# end
	
	
	
	
        #Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1")).css("div.quoteDetails")[0].css(".quoteText").text
	
		
        
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number 
	

	# def self.scrape_quote_lists_from_doc(doc) COPY
	# 	quotes=[]
	# 	quote_list=doc.css("div.quoteDetails")
	# 	quote_list.each_with_index do |quote,index|
			
	# 		q=Quote.new(
	# 			quote.css(".quoteText").text.strip.split("\n"),
	# 			quote.css("a[title='View this quote']").text,
	# 			quote.css("a[href^='/work']").empty? ?   quote.css("a[href^='/work']") :  quote.css("a[href^='/work']")[0]['href'])
	# 		    q.author_link= quote.css("a[href^='/author']")[0]['href']
                 
 #               quotes<<q
               
               

	# 		  puts "the second \" occurs at #{q.content.index('-')}" 
	# 		  puts q.content
	# 		  puts q.likes
	# 		  puts "SCRIPTURE :::: #{q.scripture_it_belongs_to}"
	# 		  puts  " AUTHO_LINK ::::: #{q.author_link}"
	# 		  puts "weeeeeeeeeeeeeeeeeeeeeeeeeeeeeee--------------------------------------------------------------------------------"
	# 		 end 
		
	# end
	

	private

     def self.scrape_keywords_list(phrase)
		page=Nokogiri::HTML(open(phrase_to_search_string(phrase)))
		list=scrape_quote_lists_from_doc(page)
		



		#displayed qoute content
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number
     end

	def self.scrape_quote_lists_from_doc(doc)
		quotes=[]
		quote_list=doc.css("div.quoteDetails")
		quote_list.each do |quote|
			
			q=Quote.new(
				quote.css(".quoteText").text.strip.split("\n")[0],
				quote.css("a[title='View this quote']").text,
				quote.css(".quoteText").text.strip.split("\n")[3],
				quote.css(".quoteText").text.strip.split("\n")[2])

			    #quote.css("a[href^='/work']").empty? ?   quote.css("a[href^='/work']") :  quote.css("a[href^='/work']")[0]['href']
			    q.author_link= quote.css("a[href^='/author']")[0]['href']
                 
               quotes<<q
               
                
			 end 
		quotes
	end

	def self.scrape_popular_list
		
		page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=#{@@curr_pop_pg}"))
		list=scrape_quote_lists_from_doc(page)
             #Quote.scrape_popular_list
             		
			#scrapes the gref for author and then calls create_with_link
			#Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1")).css("div.quote").css("a.authorOrTitle")["href"]
	 end

	 def self.what_now?
	 	puts "enter 'author' to know more amout author"
	 	puts  "or"
	 	puts  "press enter to reload all the quotes"
	 	 ans=gets.strip.downcase
	 	 if ans=="author"  
            Author.interface 
            else 
            	puts "not author"
            end
	 	
	 end

	 def self.determine_and_execute_response(input,list)
         input=input.to_i==0? input : input.to_i
         case input
         when 1..list.length
         	view_n_quote_info(list,input-1)
             what_now?
         	 #what_now?
         when "more"
         	#popular interface with nextpage
         	@@curr_pop_pg+=1
         	self.popular_interface
         else
         	puts "I don't understand (@ - @) "
         end

	 end
	 def self.display_list(list)
		list.each do |item|
           	puts item.content
			
		end
		
	end	
			
	
	def self.phrase_to_search_string(phrase)
		words=phrase.split(' ')
		str=words.join('+')

		search_string="https://www.goodreads.com/quotes/search?commit=Search&page=#{curr_word_pg}&q=#{str}"
	end

   def self.view_n_quote_info(list,n)
		puts list[n].content
		puts list[n].likes
		puts list[n].scripture_it_belongs_to
		puts list[n].author_name
		# ask to go in details of author
		
     end
	
	
end