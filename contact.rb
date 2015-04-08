class Contact

  attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def to_s
    print "First Name: #{first_name} "
    print "Last Name: #{last_name} "
    print "Email: #{email} "
    print "Note: #{note} "
    print "id: #{id}"
  end



end