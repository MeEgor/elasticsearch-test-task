# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# populate generator
def gc i
  chars = %w{a b c d e f g h i j k l m n o p q r s t w v x y z}
  i >= 0 ? chars[i] : ''
end

def nts i
  i < 10 ? "0#{ i }" : i.to_s
end

def generate_article i
  "#{ gc(i / 99) }-#{ gc(i / 99 - 1)  }#{ nts(i % 99) }".upcase
end

300.times do |i|
  article = generate_article i
  params = {
    article: article,
    name: "Name of #{ article }".delete('-')
  }
  Good.create params
end