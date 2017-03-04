# module Shout
#
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end
#
#   def self.yelling_happily(words)
#     words + ";D  =)  XD  :D  :)"
#   end
#
# end
#
#
# p Shout.yell_angrily("aaaaarrrrggg")
# p Shout.yelling_happily("boooyaaaa")

module Shout

   def yell_angrily(words)
     words + "!!!" + " :("
   end

   def yelling_happily(words)
     words + ";D  =)  XD  :D  :)"
   end

 end

class Protestor
  include Shout
end

class ConcertFan
  include Shout
end

concert_goer = ConcertFan.new
p concert_goer.yelling_happily("weeeeee")
protestor = Protestor.new
p protestor.yell_angrily("impeach the president")
