# Final project idea: site similar to reddit where users can upvote/downvote but the posts are pictures
# the final project data model will have user, photos, and votes tables
# user to photos has a one-to-many relationship
# user to votes has a many-to-many relationship
# photos to votes has a one-to-one relationship

# defines a method, in_groups_of, with parameters number and fill_with; the initial value for fill_with is nil
def in_groups_of(number, fill_with = nil)
  # number.to_i turns the number parameter into an integer. if the integer is less than or equal to 0
  if number.to_i <= 0
    # if the integer is less than or equal to 0, raise an error with the following message:
    raise ArgumentError,
      # the message embeds thr ruby number.inspect which returns the number into a string
      "Group size must be a positive integer, was #{number.inspect}"
  end

  # if the fill_with parameter is set to false ..
  if fill_with == false
    # setting a variable collection equal to self, which is the current object in the class
    collection = self
  else
    # size % number gives how many extra we have;
    # subtracting from number gives how many to add;
    # modulo number ensures we don't add group of just fill.
    # setting a variable padding equal to the number of items that needs to be filled in to an array grouped by a set number
    padding = (number - size % number) % number
    # set the variable collection to a duplicate of
    collection = dup.concat(Array.new(padding, fill_with))
  end

  # if a ruby block, which is inclosed by {}, returns true
  if block_given?
    # if a block is given, taking that collection and slicing it by the number specified and returning the slice
    collection.each_slice(number) { |slice| yield(slice) }
  else
    # if a block is not given, taking that collection and slicing it into arrays with the number specified filling each array
    collection.each_slice(number).to_a
  end
end