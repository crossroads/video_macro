namespace :macro do |ns|

  task :deploy do
    macro_name = "video_macro"
    github_url = "http://github.com/crossroads/#{macro_name}.git"
    plugins_path ="/opt/rails/mingle/vendor/plugins"
    macro_path = File.join(plugins_path, macro_name)
    
    machine = "mingle.crossroadsint.org"
    user = "root"
    
    command = "if [ -d #{File.join(plugins_path, macro_name)} ]; \
then cd #{plugins_path} && git pull origin master; \
else git clone #{github_url} #{macro_path}; \
fi; /etc/init.d/mingle restart"

    system("ssh #{user}@#{machine} '#{command}'")
    
    puts "#{macro_name} successfully deployed to #{machine}."
  end

end
