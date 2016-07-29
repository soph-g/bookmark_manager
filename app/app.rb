ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

class BookmarkManager < Sinatra::Base

  require_relative 'data_mapper_setup'
  require_relative 'server'
  require_relative 'controller/links'
  require_relative 'controller/sessions'
  require_relative 'controller/tags'
  require_relative 'controller/users'

  run! if app_file == $0

end
