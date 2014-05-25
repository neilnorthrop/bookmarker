# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

f = File.open("lib/bookmarks_5_24_14.html", "r")

f.readlines.each do |line|
  bookmark = Bookmark.new
  url_match = line.match(/"http.*\/"\s\b|"https.*\/"\s\b|"http.*"/).to_s
  title_match = line.match(/">.*?.*?</).to_s

  bookmark.title = title_match.gsub("\">", "").gsub("<", "")

  bookmark.url = url_match.split(" ").reverse.pop

  if bookmark.url == "" || bookmark.title == ""
    puts "EMPTY"
  else
    bookmark.save
  end
end

f.close