require 'data_mapper'

class Proposal
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :title,       String, required: true
  property :description, Text,   required: true, :length => 1..500
  property :author,      String, required: true
  # property :date,        DateTime

  validates_length_of :title, :min => 3
  validates_length_of :author, :min => 3

  def same_title?(a_proposal)
    self.title.eql? a_proposal.title
  end

  def append_author_to_title
    self.title += (" - " + @author)
  end
end