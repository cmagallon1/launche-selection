web: rails server -p $PORT
worker: bundle exec sidekiq -t 25 -c 2 -q default -q mailers
