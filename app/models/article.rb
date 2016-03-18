require 'elasticsearch/model'

class Article < ActiveRecord::Base
  include Searchable
  mount_uploader :image, ImageUploader
end