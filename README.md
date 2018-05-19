doesmystartupideasuck.com
doesmystartupsuck.com
share. validate. discover.

#video what is DMSIS?
#video I will steal your startup idea
#video Will you steal my startup idea?

#facebook login DONE
#like on facebook
#share on facebook
#homepage
#sidebar stats
#my likes XXX
#my cofoundery XXX
#elasticsearch XXX
#pundit XXX
#devise soft delete

#fresh DONE
#top liked DONE

Basic functions: 
1) sign in with google or facebook
2) submit idea (post)
3) see all posts
4) vote for posts except of yours
5) comment posts
6) text search for posts

Technologies:

postgresql
haml
bootstrap 4
simple_form
devise

oauth - fb/google
acts_as_votable
ransack
pundit for roles


gem 'haml-rails'
gem 'haml'
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 4.1.1'
gem 'simple_form'

gem "pundit"
gem 'devise'
gem 'devise-bootstrap-views'
gem "rolify"


rails new doesmystartupideasuck --database=postgresql
rails g scaffold idea name:string description:text user:references --no-stylesheets
rails g scaffold comment body idea:references user:references

