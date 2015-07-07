class Good < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
