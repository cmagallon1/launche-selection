# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#set :environment, "development" 
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every '0 10 20 * *' do
   rake "email:send_emails"
 end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
