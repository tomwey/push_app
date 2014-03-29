root = "/home/deployer/apps/keke_official_website/current"
working_directory root
pid "#{root}/tmp/pids/unicorn_keke_official_website.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.keke_official_website.sock"
worker_processes 2
timeout 30