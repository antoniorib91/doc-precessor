require 'json'

namespace :files do
  namespace :data do 
    desc "Check files inside data/in directory and deploy in data/out"
    task :in => :environment do
      service = FileProcessorService.new
      service.process_in()
    end
  end
end
