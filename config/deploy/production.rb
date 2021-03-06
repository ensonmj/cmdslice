# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{codeslice.me}
role :web, %w{codeslice.me}
role :db,  %w{codeslice.me}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'codeslice.me',
  user: 'deploy',
  roles: %w{web app db}, primary: :true,
  ssh_options: {
    port: 21314,
    forward_agent: true
  }

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#set :ssh_options, {
  #keys: %w(/home/ensonmj/.ssh/id_rsa),
  #forward_agent: false,
  #auth_methods: %w(publicekey password)
#}
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

namespace :deploy do
  after :updated, 'newrelic:notice_deployment'
end
