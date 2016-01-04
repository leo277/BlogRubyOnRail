class Post < ActiveRecord::Base

validates :title, :content, presence: true
validates :title, length: {minimum: 2}
validates :title, uniqueness: true
#you can set a specific error message as well, eg:
#validates :title, uniqueness: {message: "Title already existed!"}
#when using full_message, custom message wont work


#if there are errors, show them in the correct page in new.html
end
