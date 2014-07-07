module Puppet::Parser::Functions
	newfunction(:pwd_for_shadow_redhat, :type => :rvalue) do |args|
		%x{/usr/bin/openssl passwd -1 -salt #{args[0]} #{args[1]}}.chomp
	end
end
