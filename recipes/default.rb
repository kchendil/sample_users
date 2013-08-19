#
# Cookbook Name:: idm_engine_patch
# Recipe:: default
#
# Copyright 2013, Chendil Kumar Manoharan
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

template "/tmp/sample_data.ldif" do
  source "sample_data.ldif.erb"  
  mode "0644"  
end

template "/tmp/schema.ldif" do
  source "schema.ldif.erb"  
  mode "0644"  
end


execute "Change schema" do
 user "root" 
 command "ice -lice.log -v -SLDIF -f /tmp/schema.ldif -c -v -DLDAP -s127.0.0.1 -p389 -dcn=admin,ou=servers,o=system -wnovell123$ -F -B"
  action :run
end

execute "Add Sample data" do
 user "root" 
 command "ice -lice.log -v -SLDIF -f /tmp/sample_data.ldif -c -v -DLDAP -s127.0.0.1 -p389 -dcn=admin,ou=servers,o=system -wnovell123$ -F -B"
  action :run
end


