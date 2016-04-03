namespace :tags do

  desc "rebuild the tags file for the project"
  task :build => :environment do
    chdir Rails.root
    sh "ripper-tags -R -fTAGS"
  end

end
