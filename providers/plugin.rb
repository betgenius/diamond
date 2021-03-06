# Enables a Collector for Diamond and restarts it
#  
#    diamond_plugin "CPUCollector" do
#     action :enable
#     options({})
#    end

action :enable do
  template new_resource.name do
    path new_resource.collectors_path + "/" + new_resource.name + ".conf"
    owner "root"
    group "root"
    mode "0644"
    source new_resource.options["source"] || "generic_collector_config.conf.erb"
    cookbook new_resource.options["cookbook"] || "diamond"
    variables :name=>new_resource.name, :options=>new_resource.options
    helpers(Chef::Recipe::Diamond)
    notifies :restart, "runit_service[#{new_resource.runit_name}]"
  end
  new_resource.updated_by_last_action(true)
end

# Disables a Collector for Diamond
#
#    diamond_plugin "CPUCollector" do
#     action :disable
#     options({})
#    end

action :disable do
  file new_resource.name do
    path new_resource.collectors_path + "/" + new_resource.name + ".conf"
    action :delete
    notifies :restart, "runit_service[#{new_resource.runit_name}]"
  end
  new_resource.updated_by_last_action(true)
end
