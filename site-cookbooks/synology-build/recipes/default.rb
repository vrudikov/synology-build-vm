%w{ vim tree build-essential cmake }.each do |pkg|
  package pkg
end

remote_file "Download toolchain" do |file|
  path "/usr/local/#{node['synology-build']['toolchain']['tarball']}"
  source node['synology-build']['toolchain']['url']
  checksum node['synology-build']['toolchain']['checksum']
  notifies :run, "execute[unpack toolchain]", :immediately
end

execute "unpack toolchain" do
  command "tar -xzvf #{node['synology-build']['toolchain']['tarball']}"
  action :nothing
  cwd "/usr/local"
end

template "/usr/local/toolchain-path.sh" do
  mode 00755
  owner "root"
  group "root"
  source "toolchain-path.sh.erb"
  variables(
    :platform => node['synology-build']['toolchain']['platform']
  )
end

execute 'add toolchain path to bashrc' do
  command "echo '\n. /usr/local/toolchain-path.sh' >> /home/vagrant/.bashrc"
  not_if "grep toolchain-path.sh /home/vagrant/.bashrc"
end