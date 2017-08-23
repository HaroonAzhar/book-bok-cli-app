require 'pry'
class Quote
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author, :author_link,:author_name
	 
    @@curr_pg=1
    
	def initialize(cont,likes,book,author_name,author=nil)
		@content=cont
		@likes=likes
		@author_name=author_name
		@scripture_it_belongs_to=book
		@author=author

	end

	
    
	
	


	

   

	private

     
	 

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






	 




			
	
	

   def self.view_n_quote_info(list,n)
   	    
		puts "\n#{list[n].content}"
		puts "\n-#{list[n].author_name}#{list[n].scripture_it_belongs_to }"
		puts "\nIt has #{list[n].likes}"
		
	end

	def display
		puts "\n#{self.content}"
		puts "\n-#{self.author_name}#{self.scripture_it_belongs_to }"
		puts "\nIt has #{self.likes}"
	end
	
	
end