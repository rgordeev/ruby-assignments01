class Person
  #have a first_name and last_name attribute with public accessors
  #attr_accessor
  #attr_accessor
  attr_accessor :first_name
  attr_accessor :last_name
  #have a class attribute called `people` that holds an array of objects
  @@people = []
  #have an `initialize` method to initialize each instance
  def initialize(first,last)#should take 2 parameters for first_name and last_name
    #assign those parameters to instance variables
    #add the created instance (self) to people class variable
    @first_name = first
    @last_name = last
    @@people.push self
  end

  #have a `search` method to locate all people with a matching `last_name`
  def self.search(last_name)
    #accept a `last_name` parameter
    #search the `people` class attribute for instances with the same `last_name`
    #return a collection of matching instances
    @@people.select {|man| man.last_name==last_name}
  end

  #have a `to_s` method to return a formatted string of the person's name
  def to_s()
    #return a formatted string as `first_name(space)last_name`
    "#@first_name #@last_name"
  end
end
