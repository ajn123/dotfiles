



```ruby
require "#{Rails.root}/app/helpers/application_helper"


include ApplicationHelper

namespace :db do
  desc "Generate a new blog post markdown"
    task new_article: :environment do
    cp 'lib/assets/articles/template.md', "lib/assets/articles/NEW_ARTICLE#{Time.now.strftime("%s")}.md"
    puts 'new article created!'
  end

   task populate: :environment do
    Article.destroy_all

    #if User.count == 0
    #    User.create!(name: "AJ", email: "aj@psychowarfare.com")
    #end

    #puts Dir.pwd
    a = File.join("lib", "assets", "articles", "*.md")
    Dir.glob(a).reject { |name| /.*(template|NEW_ARTICLE).*/ =~ name }.each do |file|
      File.open(file, "r") do |f|
        contents = f.read
        mkdown = Metadown.render(contents)
        md = mkdown.metadata

        unrendered_content = contents.sub(/^---(\n|.)*---/, '')
        #puts unrendered_content


        puts md["title"]

        article = Article.create!(
                        title: md["title"],
                        content: markdown(unrendered_content),
                        header_image: md["header_image"],
                        published: md["published"],
                        useful_links: md["useful_links"],
                        people_mentioned: md["people_mentioned"],
                        written_at_date: md["written_at_date"],
                        timestamp: md["timestamp"],
                        embedded_link: md["embedded_link"],
                        media: md["media"])


        article.add_tag(md["tags"])
        puts article.useful_links
        puts article.people_mentioned
        puts article.header_image
        puts article.tags

      end
    end
    Article.find_each(&:save)
    puts "Article Count: #{Article.count}"
  end

  desc 'destroy all user models'
  task destroy_users: :environment do
    User.destroy_all
    puts "Users Destroyed"

  end




end
```
