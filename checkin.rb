#!/usr/bin/env ruby

PATHLIST = ENV["AUTOCOMMIT_PATHS"] || "~/org"

exit(0) if PATHLIST.empty?

PATHLIST.split.each do |path|
  fn = File.expand_path(path)
  if fn && File.exists?(fn) && File.directory?(fn)
    Dir.chdir(fn)
    `git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1`
    `git add .`
    `git commit -m "checkin.rb autocommit $(date +'%Y%m%d_%H%M%S')"`
  end
end
