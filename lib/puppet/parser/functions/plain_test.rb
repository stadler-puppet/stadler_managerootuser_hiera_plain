module Puppet::Parser::Functions
	newfunction(:plain_test, :type => :rvalue) do |args|
		%x{/usr/bin/openssl passwd #{args[0]}}
	end
end
