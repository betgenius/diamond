site :opscode

metadata

cookbook "python"
cookbook "git"
cookbook "build-essential","3.2.0"
cookbook "runit","1.5.8"

group :integration do
  cookbook "apt"
  cookbook "yum"
  cookbook "minitest-handler"
  cookbook "diamond_test", path: "test/cookbooks/diamond_test"
end
