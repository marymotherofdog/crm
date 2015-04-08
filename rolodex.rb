class Rolodex

  def initialize
    @contacts = []
    @id = 1
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id
    end
  end

  def delete(contact_id)
    @contacts.delete(contact_id)
  end

  def display_each
    @contacts.each do |contact|
      contact.to_s
    end
  end

  def display_specific_contact(specific_contact)
    contact = self.find(specific_contact)
    contact.to_s
  end

  def display_info_by_attribute(attribute)
    @contacts.each do |contact|
      case attribute
      when 1
        puts contact.first_name
      when 2
        puts contact.last_name
      when 3
        puts contact.email
      when 4
        puts contact.note
      end
    end
  end
end