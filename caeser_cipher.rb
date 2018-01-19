require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  string=params["string"]
  shift=params["shift"].to_i
  result=cipher(string, shift)
  thanks=thanks(result)
  erb :index, locals:{:result => result, :thanks => thanks}
end


def thanks(result)
  thanks=""
  thanks = "Thank you for using the Caeser Cipher. your string is below."  if result!=nil
end

def cipher(string, shift=0)
  result=""
  return if string==nil
  letters= string.split(//)# splits string to characters
  letters.each do |x| # selects characters
    number = x.ord # converts characters to ascii
    if number.between?(97,122)# A-Z?
       number = number + shift
      if number >122 # if result is past Z
         number = (number -122) %26 + 96 #
      end
    elsif number.between?(65,90)
      number = number + shift
      if number >90
        number = (number-90) %26 + 64
      end
    end
    result<<number.chr
  end
  result
end
