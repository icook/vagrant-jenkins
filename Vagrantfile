# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64-au-syd"
  config.vm.hostname = "jenkins"
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :private_network, ip: "192.168.100.1"

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe "git"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "nginx"
    chef.add_recipe "mysql::server"
    chef.add_recipe "java"
    chef.add_recipe "jenkins"

    chef.json = {
      :java => {
        :install_flavor => "oracle",
        :oracle => {
          "accept_oracle_download_terms" => true
        }
      },
      :jenkins => {
        :http_proxy => {
          :variant => "nginx"
        }
      },
      :git        => {
        :prefix => "/usr/local"
      },
      :postgresql => {
        :config   => {
          :listen_addresses => "*",
          :port             => "5432"
        },
        :pg_hba   => [
          {
            :type   => "local",
            :db     => "postgres",
            :user   => "postgres",
            :addr   => nil,
            :method => "trust"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "0.0.0.0/0",
            :method => "md5"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "::1/0",
            :method => "md5"
          }
        ],
        :password => {
          :postgres => ""
        }
      },
      :rbenv      => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => [
              "1.9.3-p392",
              "2.0.0-p0"
            ],
            :global => "1.9.3-p392"
          }
        ]
      },
      :mysql      => {
        :server_root_password   => "",
        :server_repl_password   => "",
        :server_debian_password => "",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      },
      :nginx      => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "www-data",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024"
      }
    }
  end
end
