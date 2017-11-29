#!/usr/bin/env ruby

class ArabicToEnglish
  attr_accessor :ret

  BASICS =  {
    1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
    5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
    10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
    15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
  }.freeze

  ADVANCED = {
    2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty',
    6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety'
  }.freeze

  def initialize
    @ret = ''
  end

  def translate(number)
    raise ArgumentError, 'Argument is not an Integer' unless number.is_a? Integer
    raise ArgumentError, 'Argument should be a value between 0 and 999' unless number >= 0 and number <= 999

    return "zero" if number == 0

    @ret += "#{BASICS[number / 100]} hundred " if number / 100 > 0
    ten(number % 100) if number % 100 > 0

    @ret.strip
  end

  private def ten(n)
    @ret += BASICS[n] and return if BASICS.key?(n)
    @ret += "#{ADVANCED[n/10]} "
    @ret += BASICS[n%10] if n%10 != 0
  end

end

if ARGV[0]
  puts ArabicToEnglish.new.translate ARGV[0].to_i
else
  puts "usage: ./arabic2english.rb number"
end