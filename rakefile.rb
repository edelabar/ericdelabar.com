task :default => [:build]

desc "Launch preview environment"
task :preview do
  system "jekyll --no-server"
end

desc "Build site"
task :build do |task, args|
  system "jekyll --no-auto"
end

desc "Package app for production"
task :package do
  ENV['JEKYLL_ENV'] = 'production'
  
  Rake::Task["build"].invoke

  print "Compressing assets..."
  system "jammit -o _site/min -c _assets.yml"
  puts "done."
end

desc "Deploy latest code in _site to production"
task :deploy do
  system(%{
    rsync -avz --delete _site/ edelabar@ericdelabar.com:/home/edelabar/new.ericdelabar.com/
  })
end