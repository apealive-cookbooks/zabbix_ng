#
# Cookbook Name:: zabbix_ng
# Recipe:: repository
#
# Copyright (C) 2015 Chris Aumann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Official Zabbix repository
# TODO, move repo keys and url to attributes
case node['platform']
when 'debian'
  apt_repository 'zabbix' do
    uri 'http://repo.zabbix.com/zabbix/2.4/debian'
    distribution node['lsb']['codename']
    components %w(main)
    key 'http://repo.zabbix.com/zabbix-official-repo.key'
  end
when 'ubuntu'
  apt_repository 'zabbix' do
    uri 'http://repo.zabbix.com/zabbix/2.4/ubuntu'
    distribution node['lsb']['codename']
    components %w(main)
    key 'http://repo.zabbix.com/zabbix-official-repo.key'
  end
when 'redhat', 'centos', 'fedora'
  yum_repository 'zabbix' do
    description "Official zabbix repository"
    baseurl 'http://repo.zabbix.com/zabbix/2.4/rhel/7/x86_64'
    gpgkey 'http://repo.zabbix.com/zabbix-official-repo.key'
    action :create
  end
  include_recipe 'yum-epel'
end



