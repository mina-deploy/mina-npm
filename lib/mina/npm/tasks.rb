set :npm_bin, 'npm'
set :bower_bin, 'bower'
set :grunt_bin, 'grunt'
set :yarn_bin, 'yarn'
set :npm_options, '--production'
set :bower_options, '--allow-root'
set :grunt_options, ''
set :grunt_task, 'build'
set :yarn_options, '--production'

namespace :npm do
  desc 'Install node modules using Npm.'
  task install: :environment do
    command %{
      echo "-----> Installing node modules using Npm"
      sub_directory=$(pwd | sed -r "s/.*?$(basename $build_path)//g")
      #{echo_cmd %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/$sub_directory/node_modules"]}
      #{echo_cmd %[ln -s "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/$sub_directory/node_modules" "node_modules"]}
      #{echo_cmd %[#{fetch(:npm_bin)} install #{fetch(:npm_options)}]}
    }
  end
end

namespace :yarn do
  desc 'Install node modules using Yarn.'
  task install: :environment do
    command %{
      echo "-----> Installing node modules using Yarn"
      sub_directory=$(pwd | sed -r "s/.*?$(basename $build_path)//g")
      #{echo_cmd %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/$sub_directory/node_modules"]}
      #{echo_cmd %[ln -s "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/$sub_directory/node_modules" "node_modules"]}
      #{echo_cmd %[#{fetch(:yarn_bin)} install #{fetch(:yarn_options)}]}
    }
  end
end

namespace :bower do
  desc "Install bower modules."
  task install: :environment do
    command %{
      echo "-----> Installing bower modules"
      sub_directory=$(pwd | sed -r "s/.*?$(basename $build_path)//g")
      #{echo_cmd %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/$sub_directory/bower_components"]}
      #{echo_cmd %[ln -s "#{fetch(:deploy_to)}/#{fetch(:shared_path)}/$sub_directory/bower_components" "bower_components"]}
      #{echo_cmd %[[ -f bower.json ] && (#{fetch(:bower_bin)} install #{fetch(:bower_options)}) || ! [ -f bower.json ]]}
    }
  end
end

namespace :grunt do
  desc "Launch a task with grunt. Set the grunt_task (defaults to \"build\") variable before calling this."
  task task: :environment do
    command %{
      echo "-----> Launch a build with Grunt"
      #{echo_cmd %[[ -f Gruntfile.js ] && (#{fetch(:grunt_bin)} #{fetch(:grunt_task)} #{fetch(:grunt_options)}) || ! [ -f Gruntfile.js ]]}
    }
  end
end
