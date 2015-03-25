node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping application #{application} as it is not an Rails app")
    next
  end

  Chef::Log.debug('Installing bower...')

  execute 'install bower' do
    cwd "#{deploy[:current_path]}"
    command 'npm install -g bower'
    user 'root'
  end
end
