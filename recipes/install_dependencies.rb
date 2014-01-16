################################################################################
# Install dependencies
packages = %w{bash curl sudo}

packages.each do |pkg|
  
  package pkg do
    action :install
  end
  
end
