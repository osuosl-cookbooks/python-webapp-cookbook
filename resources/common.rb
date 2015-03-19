actions :install
default_action :install

# Name the resource
attribute :name, :name_attribute => true, 'kind_of' => String,
                 :required => true

# Creates the user if they do not already exist
attribute :create_user, 'kind_of' => [TrueClass, FalseClass], :default => false

# Create the owner, path, or group if they do not exist
# If path is nil it will default to '/opt/<name_attribute>'
attribute :path, 'kind_of' => [String, nil], :default => nil
attribute :owner, 'kind_of' => String, :default => 'chef'
attribute :group, 'kind_of' => String, :default => 'chef'

# The information necessary to check out the code
attribute :repository, 'kind_of' => String
attribute :revision, 'kind_of' => String, :default => 'master'

# Location of the virtualenv
attribute :virtualenv_path, 'kind_of' => String, :default => '/opt/venv'

# Specify the config file template, destination on the node, and variables
# If :config_template is nil, do nothing
attribute :config_template, 'kind_of' => [String, NilClass],
                            :default => 'settings.py.erb'
# The destination is an absolute path
attribute :config_destination, 'kind_of' => String,
                               :default => '/opt/app/settings.py'
attribute :config_vars, 'kind_of' => Hash

# If this is set, install that requirements file. If it is not, install a
# setup.py. If the setup.py does not exist, fail.
attribute :requirements_file, 'kind_of' => [String, NilClass], :default => nil
