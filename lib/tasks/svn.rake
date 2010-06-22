namespace :svn do
  # svn tasks
  desc "Add all new files except thoose specifically excluded by svn:ignore."
  task :add do
    %x[svn st].split(/\n/).each do |line|
      if line[0, 1] =~ /\?/
        trimmed_line = line.delete('?').lstrip
        %x[svn add #{trimmed_line}]
        puts %[added #{trimmed_line}]
      end
    end
  end
  
  task :delete do
    %x[svn st].split(/\n/).each do |line|
      if line[0, 1] =~ /\!/
        trimmed_line = line.delete('!').lstrip
        %x[svn rm #{trimmed_line}]
        puts %[removed #{trimmed_line}]
      end
    end
  end
  
  task :st do
    puts %x[svn st]
  end
  
  desc "Runs 'svn update' to get the revision in sync."
  task :up do
    puts (out = %x[svn up])
    @updated_migrations = !(out =~ %r[^U\s+db/migrate/\d{14}.+\.rb]).nil?
    @new_migrations_added = !(out =~ %r[^A\s+db/migrate/\d{14}.+\.rb]).nil?
  end
      
end
