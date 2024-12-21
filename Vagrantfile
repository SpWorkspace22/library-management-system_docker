Vagrant.configure("2") do |config| 
 vm_names = ["MANAGER_1","WORKER_1"]
 vm_names.each do |name|
  config.vm.define name do |vm|
    vm.vm.box = "bento/ubuntu-22.04"
    vm.vm.network "public_network", :interface => "wlo1"	
    vm.vm.provision "shell", path: "script.sh"
  end
 end
end
