#
# Cookbook Name:: zabbix_ng
# Attributes:: default
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

default['zabbix_ng']['zabbix_server'] = '127.0.0.1'
default['zabbix_ng']['version'] = value_for_platform_family(
  'rhel' => '3.0.0-1.el7',
  'default' => '3.0'
)


default['zabbix_ng']['repository']['key'] = 'http://repo.zabbix.com/zabbix-official-repo.key'
uri_version = node['zabbix_ng']['version'].split('.')[0..1].join('.')
default['zabbix_ng']['repository']['uri'] = value_for_platform(
  ['redhat', 'centos', 'fedora'] => {
    "~> 6" => "http://repo.zabbix.com/zabbix/#{uri_version}/rhel/6/x86_64",
    "~> 7" => "http://repo.zabbix.com/zabbix/#{uri_version}/rhel/7/x86_64" },
  'debian' => { 'default' => "http://repo.zabbix.com/zabbix/#{uri_version}/debian"},
  'ubuntu' => { 'default' => "http://repo.zabbix.com/zabbix/#{uri_version}/ubuntu"},
)


