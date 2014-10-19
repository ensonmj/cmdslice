#!/usr/bin/env puma

# kill -s SIGUSR2 pid # Restart puma
# kill -s SIGTERM pid # Stop puma

environment ENV['RAILS_ENV'] || 'development'
threads 0, 16
bind "unix:tmp/sockets/codeslice-puma.sock"
pidfile "tmp/pids/puma.pid"
state_path "tmp/pids/puma.state"
stdout_redirect "log/puma.log", true

on_restart do
  puts "On restart..."
end

# --- cluster mode ---
workers 0

preload_app!
