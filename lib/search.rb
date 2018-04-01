require 'rest-client'

class BingSearch 

    def self.input_handler
        loop do
            puts "\nEnter the query:"
            query = gets.chomp
            if !(/[\w]/ === query)
                puts "Empty input!"
                next
            end
            search(query)
        end
    end

    def self.search(query)
        result = RestClient.get 'https://www.bing.ru/search?q=' + query
        save_result(result, query)
    end

    def self.format_query(query)
        query.strip!
        query.gsub!(/\s+/, '+')
        return query
    end

    def self.save_result(result, query)
        puts "\n============================"
        puts "Saving search result..."
        puts "============================"

        formatted_query = format_query(query)

        File.open("../results/search_#{formatted_query}.html", 'w') do |file|
            file.puts result
        end

        sleep(1.5)
        puts "\n============================"
        puts "Search result successfuly saved in 'results' folder!"
        puts "============================"
    end

end 

BingSearch.input_handler