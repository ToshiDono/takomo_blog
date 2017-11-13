User.delete_all
Article.delete_all
Comment.delete_all

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
