class BeerSong
  class << self
    def recite(bottles, n)
      string = ''

      n.times do
        string << "\n" unless string.empty?

        case bottles
        when 0
          string << "#{no_more('N')} #{bottle_of_beer} #{location}, #{no_more} #{bottle_of_beer}.\n"\
                    "#{buy_more}, 99 #{bottle_of_beer} #{location}.\n"
          bottles = 99
        when 1
          string << "#{bottles} #{bottle_of_beer('')} #{location}, #{bottles} #{bottle_of_beer('')}.\n"\
                    "#{take('it')}, #{no_more} #{bottle_of_beer} #{location}.\n"
          bottles -= 1
        when 2
          string << "#{bottles} #{bottle_of_beer} #{location}, #{bottles} #{bottle_of_beer}.\n"\
                    "#{take}, #{bottles - 1} #{bottle_of_beer('')} #{location}.\n"
          bottles -= 1
        else
          string << "#{bottles} #{bottle_of_beer} #{location}, #{bottles} #{bottle_of_beer}.\n"\
                    "#{take}, #{bottles - 1} #{bottle_of_beer} #{location}.\n"
          bottles -= 1
        end
      end

      string
    end

    private

    def buy_more
      "Go to the store and buy some more"
    end

    def no_more(n = 'n')
      "#{n}o more"
    end

    def location
      'on the wall'
    end

    def bottle_of_beer(s = 's')
      "bottle#{s} of beer"
    end

    def take(one = 'one')
      "Take #{one} down and pass it around"
    end
  end
end
