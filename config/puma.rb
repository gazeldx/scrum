module Rails
  class <<self
    def root
      File.expand_path(__FILE__).split('/')[0..-3].join('/')
    end
  end
end

basedir = Rails.root

rackup      "#{basedir}/config.ru"

port        ENV['PORT']     || 3000
environment ENV['RAILS_ENV'] || 'development'

daemonize true

pidfile     "#{basedir}/tmp/pids/puma.pid"
state_path  "#{basedir}/tmp/pids/puma.state"

stdout_redirect "#{basedir}/log/stdout", "#{basedir}/log/stderr", true

workers 3
threads 0, 16

bind        "unix:///var/run/puma.scrum.sock"

preload_app!

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end