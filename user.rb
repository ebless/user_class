require 'highline/import'
require 'digest'

class User
	attr_accessor :name, :location, :status, :photos

	def initialize(email, password, birthdate, photos=[])
		@password = Digest::MD5::hexdigest(password)
		@email = email
		@birthdate = birthdate
		@photos = photos

		puts "Confirm your password:"
		usr_pass = ask('') {|q| q.echo = false}
		if Digest::MD5::hexdigest(usr_pass) == @password
			puts 'Welcome!'
		else
			puts "Try again: "
			usr_pass = ask('') {|q| q.echo = false}
			if Digest::MD5::hexdigest(usr_pass) == @password
				puts "Welcome!"
			else
				exit
			end
		end
	end
end

ned = User.new('ebless@lsoc.org', 'password123', '9/28/2000')

puts "To add a photo, type 1. To logout, type 2."
input = gets.chomp

if input == '1'
	puts "Input the photo:"
	photo = gets.chomp
	ned.photos << photo
else
	exit
end
