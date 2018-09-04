User.find_each { |user| User.reset_counters(user.id, :ideas) }
User.find_each { |user| User.reset_counters(user.id, :cofounders) }
User.find_each { |user| User.reset_counters(user.id, :favorites) }
Tag.find_each { |tag| Tag.reset_counters(tag.id, :idea_tags) }
User.find_each {|m| m.update_attributes(updated_at: Time.now)}



pg_restore --verbose --clean --no-acl --no-owner -h localhost -U yaro -d doesmystartupideasuck_development latest.dump
Idea.find(60).update_attributes!(user_id: "20")

doesmystartupideasuck.com
doesmystartupsuck.com
share. validate. discover.

#video what is DMSIS?
#video I will steal your startup idea
#video Will you steal my startup idea?

#not allow "." in idea.name
#characters left

#similar project links
#attachements

#cards DONE
#facebook login DONE
#like on facebook
#share on facebook
#homepage DONE
#sidebar stats DONE
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

