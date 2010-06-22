desc "Pre-Checkin."
task :pc => %w[
  pre_checkin:show_start
  svn:delete
  svn:up
  pre_checkin:fail_on_conflict
  pre_checkin:fail_on_updated_migration
  pre_checkin:migrate_database
  default
  svn:add
  svn:st
  pre_checkin:show_success
  log:clear
]

namespace :pre_checkin do

  def timestamp(label)
    time = Time.now
    puts "*** #{label} @ #{time} ***"
    time
  end
  
  task :show_start do
    @start_time = timestamp("BUILD")
  end

  task :show_success do
    end_time = timestamp "SUCCESSFUL BUILD"
    puts "BUILD TIME = #{(end_time - @start_time) / 60} minutes"
  end
  
  desc "Runs 'db:migrate' task if new migrations were added during 'svn:up' task"
  task :migrate_database do
    if @new_migrations_added
      Rake::Task['db:migrate'].invoke
    end
  end
  
  task :fail_on_conflict do
    %x[svn st].split("\n").any? do |line|
      raise "svn conflict detected" if line =~ /^\s*C\s+/
    end
  end
  
  task :fail_on_updated_migration do
    if @updated_migrations
      raise "Oh no! A migration update was detected! You're on your own now, buddy!"
    end
  end
  
end
