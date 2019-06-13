# Without this, a warning is seen:
#
#   puppetlabs_spec_helper: defaults `mock_with` to `:mocha`.
#
# but the RSpec.configure needs to come before require
# puppetlabs_spec_helper.
#
RSpec.configure do |c|
  c.mock_with :mocha
end

require 'puppetlabs_spec_helper/module_spec_helper'

FileUtils::mkdir_p 'catalogs'

RSpec.configure do |c|
  c.color        = true
  c.hiera_config = 'spec/fixtures/hiera.yaml'

  c.formatter      = :documentation
  c.mock_framework = :rspec

  c.default_facts   = {
    :concat_basedir  => '/var/lib/puppet/concat',
    :espv            => '/dev/sdc',
    :id              => '1',
    :is_virtual      => true,
    :kernel          => 'Linux',
    :operatingsystem => 'RedHat',
    :operatingsystemmajrelease => '7',
    :operatingsystemrelease    => '7.2.1511',
    :os => {'family' => 'RedHat', 'release' => {'major' => '7', 'minor' => '1', 'full' => '7.1.1503'}},
    :osfamily        => 'RedHat',
    :path            => ['/bin', '/usr/bin'],
    :puppetversion   => '5.5.1',
    :redispv         => '/dev/sdb',
    :selinux         => false,
    :filebeat_version => '6',
    :hostname        => 'myhost',
    :domain          => 'example.com',
    :fqdn            => 'myhost.example.com',
  }
end
