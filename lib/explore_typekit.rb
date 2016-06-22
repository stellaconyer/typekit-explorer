$LOAD_PATH.unshift(File.dirname(__FILE__))
require "formatter/kit"
require "formatter/kits"
require "typekit_client"

class ExploreTypekit
  def run
    puts "Let's explore your kits! Try out one of these commands:"
    puts help_text
    while true
      begin
        input = gets.chomp
        case input
        when "help"
          puts help_text
        when "list"
          puts Formatter::Kits.new(unformatted_kits: client.kits).format
        when /show*/
          kit = client.kit(kit_id: input.split[1])
          puts Formatter::Kit.new(unformatted_kit: kit).format
        when "exit"
          puts "Shutting down..."
          exit
        else
          puts "#{input} is an invalid command."
          puts help_text
        end
      rescue => e
        puts "Something went wrong: #{e}"
      end
    end
  end

  private

  def client
    @client ||= TypekitClient.new
  end

  def help_text
"\nCommands:
'exit' to exit the program
'help' to see the list of commands
'list' to see all your kits
'show [kit id]' to see more about a kit (e.g. 'show 1ek34f')
    \n"
  end
end

ExploreTypekit.new.run
