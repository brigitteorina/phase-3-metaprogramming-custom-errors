class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end
#step 2:tell our program to raise our brand new PartnerError 
#when the argument passed into the #get_married method is not an instance of the Person class. We can do that with the raise keyword
  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      begin#step 2:error handling
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    end
  end

  #step 1:creating custom errors
   # Add the following two lines:
   class PartnerError < StandardError
    #step 1:error handling
#output a custom error message when the error is raised.
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end

   end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name


# run the file one more time after error handling,
# and you'll see that not only is our custom error message printed out 
#but the program continues to run and will execute the puts beyonce.name line:

