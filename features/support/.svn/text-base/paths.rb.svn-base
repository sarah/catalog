module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
      
    when /the home page/
      '/'
      
    when /the new entry page/
      new_entry_path
      
    when /the pending entries page/
      pending_entries_path
      
    when /the published entries page/
      entries_path
    
    when /the (.*) entry page/i
      entry = Entry.find_by_title($1)
      entry_path(entry)
 
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
