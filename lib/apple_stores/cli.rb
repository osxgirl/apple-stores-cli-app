require 'apple_stores'
class AppleStores::Cli
        
        def call
            list_states
            menu
            goodbye
        end

        
        def list_states
            puts ""
            @states = AppleStores::State.all
            @states.each.with_index(1) do |states, i|
                puts "#{i}. #{states.name}" #- #{states.city}"
            end
            
            @states
        end
        

        def menu
            input = nil
            while input != "exit"
                puts "Type a Number, List or Exit"
                input = gets.strip.downcase
           
                if input.to_i < 3
                states = @states[input.to_i-1]
                   puts "#{states.name} - #{states.city} - #{states.phone}"
                elsif input == "list"
                    list_states
                
                else
                    puts "Read Below"
                end
            end
        end
        
        def goodbye
            puts "👋 Think Different."
        end

end

