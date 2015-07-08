class Good < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :name, :article, presence: true
  validates :name, :article, uniqueness: true

  before_validation do |good|
    good.article = good.article.upcase
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :article, analyzer: 'english', index_options: 'offsets'
      indexes :name,    analyzer: 'english', index_options: 'offsets'
    end
  end

  def self.search query
    if query 
      by_articles_search = where(article: query).to_a
      full_text_search   = __elasticsearch__.search({
        "query": {
          "bool": {
            "should": [
              { "match": { "article": query } },
              { "match": { "name": query } }
            ]
          }
        }
      }).records.to_a
      (by_articles_search + full_text_search).uniq
    else
      all.limit(10)
    end
  end
end
