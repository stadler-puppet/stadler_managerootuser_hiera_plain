Facter.add("centoshash") do
  setcode "openssl passwd -1 -salt 9qKtrNTb asdfasdf0"
end
