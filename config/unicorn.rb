root = "/home/deployer/apps/push_app/current"
working_directory root
pid "#{root}/tmp/pids/unicorn_push_app.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.push_app.sock"
worker_processes 2
timeout 30