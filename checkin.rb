#!/usr/bin/env ruby

PATHLIST = ENV["AUTOCOMMIT_PATHS"].to_s

return if PATHLIST.empty?

PATHLIST.split.each do |path|
  puts "path: #{path}"
  `cd #{path}`
  `git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1`
  `git add .`
  `git commit -m "checkin.rb autocommit $(date)"`
end
