require 'react-rails'
require 'jquery-rails'
require 'coffee-rails'

module Dashboard
  class Engine < ::Rails::Engine
    isolate_namespace Dashboard
  end
end
