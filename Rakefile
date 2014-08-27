#############################################################################
#
# Modified version of jekyllrb Rakefile
# https://github.com/jekyll/jekyll/blob/master/Rakefile
#
#############################################################################

require 'rake'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))
USERNAME = CONFIG["username"] || ENV['GIT_NAME']
REPO = CONFIG["repo"]
DESTINATION = CONFIG['destination']

SOURCE_BRANCH = "master"
DESTINATION_BRANCH = "master"

ENV["USERNAME"] = USERNAME
ENV["REPO"] = REPO
ENV["DESTINATION"] = DESTINATION
ENV["DESTINATION_BRANCH"] = DESTINATION_BRANCH

#############################################################################
#
# Helper functions
#
#############################################################################

def check_destination
  unless Dir.exist? DESTINATION
    Dir.mkdir DESTINATION
  end
end

#############################################################################
#
# Site tasks
#
#############################################################################

namespace :site do
  desc "Generate the site"
  task :build do
    check_destination
    sh "git submodule update --init"
    sh "bundle exec jekyll build"
  end

  desc "Generate the site and serve locally"
  task :serve do
    check_destination
    sh "git submodule update --init"
    sh "bundle exec jekyll serve"
  end

  desc "Generate the site, serve locally and watch for changes"
  task :watch do
    check_destination
    sh "git submodule update --init"
    sh "bundle exec jekyll serve --watch"
  end

  desc "Generate the site and push changes to remote origin"
  task :deploy do
    # Detect pull request
    if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
      puts 'Pull request detected. Not proceeding with deploy.'
      exit
    end

    # Configure git if this is run in Travis CI
    if ENV["TRAVIS"]
      if ENV['TRAVIS_SECURE_ENV_VARS'] == "false"
        puts 'Not able to access secure variables'
        exit
      end
      sh "git config --global user.name '#{ENV['GIT_NAME']}'"
      sh "git config --global user.email '#{ENV['GIT_EMAIL']}'"
      sh "git config --global push.default tracking"
    end

    sh "git submodule update --init"
    sh "git checkout #{SOURCE_BRANCH}"

    check_destination

    sh "./clone.sh"

    # Generate the site
    sh "bundle exec jekyll build"

    # Commit and push to github
    sh "./deploy.sh"
  end
end
