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
case node['platform']
when 'debian'
  apt_repository 'zabbix' do
    uri node['zabbix_ng']['repository']['uri']
    distribution node['lsb']['codename']
    components %w(main)
    key node['zabbix_ng']['repository']['key']
  end
when 'ubuntu'
  apt_repository 'zabbix' do
    uri node['zabbix_ng']['repository']['uri']
    distribution node['lsb']['codename']
    components %w(main)
    key node['zabbix_ng']['repository']['key']
  end
when 'redhat', 'centos', 'fedora'
  yum_repository 'zabbix' do
    description "Official zabbix repository"
    baseurl node['zabbix_ng']['repository']['uri']
    gpgkey node['zabbix_ng']['repository']['key']
  end
  include_recipe 'yum-epel'
end



