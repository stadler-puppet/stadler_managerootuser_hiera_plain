module Puppet::Parser::Functions
	newfunction(:pwd_for_shadow_debian, :type => :rvalue) do |args|
		require 'digest/sha2'
		password = args[1]
		salt = args[0]
		shadow_hash = password.crypt("$6$" + salt)
	end
end
