case (ENV['ORM'] || '').downcase
when 'dm'

class Book
  include DataMapper::Resource
  property :id, Serial
end

else

class Book < ActiveRecord::Base
  belongs_to :author
  validates_presence_of :title

  scope :sorted_by_author_name, lambda { |dir| joins(:author).order("authors.last_name #{dir}, authors.first_name #{dir}") }
end

end
