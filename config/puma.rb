module Rails
  class <<self
    def root
      File.expand_path(__FILE__).split('/')[0..-3].join('/')
    end
  end
end

basedir = Rails.root

workers 4
threads 4, 16

preload_app!

port        ENV['PORT']     || 3000
environment ENV['RAILS_ENV'] || 'development'


bind        "unix://#{basedir}/tmp/puma/puma.scrum.sock"
pidfile     "#{basedir}/tmp/puma/pid"
state_path  "#{basedir}/tmp/puma/state"
rackup      "#{basedir}/config.ru"

activate_control_app

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end