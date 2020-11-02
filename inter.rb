class Interface
    def start
      loop do
        puts "Create Station"
        puts "Create Train"
        puts "Create Route"

        decision = gets.to_i

        case decision
        when 1
          create_route
        when 2
          create_train
        end
      end
    end
