module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /the sing up page/
      new_user_registration_path
    when /the signin page/
      user_session_path
    when /the new blog page/
      new_blog_post_path
    when /the edit blog page/
      edit_blog_post_path
    
    # Add more page name => path mappings here
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World(NavigationHelpers)