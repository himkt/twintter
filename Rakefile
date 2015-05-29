# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :build do
  sh "rm -rf vendor/model"
  sh "mkdir vendor/model"
  sh "curl http://www.lr.pi.titech.ac.jp/%7Etakamura/pubs/pn_ja.dic >> vendor/model/pn_ja.dic"
  sh "curl http://www.lr.pi.titech.ac.jp/%7Etakamura/pubs/pn_en.dic >> vendor/model/pn_en.dic"
  sh "nkf -w vendor/model/pn_ja.dic > vendor/model/pn_ja.dic.conv"
  sh "rm vendor/model/pn_ja.dic"
  sh "mv vendor/model/pn_ja.dic.conv vendor/model/pn_ja.dic"
end
