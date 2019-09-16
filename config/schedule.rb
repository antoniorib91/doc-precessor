# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# job_type :sidekiq, "cd :path && BUNDLE_PATH=/bundle /usr/local/bin/bundle exec sidekiq-client :task :output"


# job_type :rake, "cd :path && BUNDLE_PATH=/bundle /usr/local/bin/bundle && :environment_variable=:environment bundle exec rake :task --silent :output"

every 1.minutes do
  # runner "ProcessFileJob.perform"
  # sidekiq "push FileProcessorWorker"
  rake "files:data:in"
end