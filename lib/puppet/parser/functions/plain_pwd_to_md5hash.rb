module Puppet::Parser::Functions
	newfunction(:plain_pwd_to_md5hash, :type => :rvalue) do |args|
		%x{/usr/bin/openssl passwd -1 -salt #{args[0]} #{args[1]}}.chomp
	end
end
