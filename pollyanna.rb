require "pry"

Group_hash = {Kait: "",Brandon: "",Andy: "",Nick: "",Tom: "",Rae: "",Jay: ""}

Group_array = ["Kait", "Brandon", "Andy", "Nick", "Tom", "Rae", "Jay"]

def assign
  new_array = Array.new(Group_array)
  new_array.each do |p2|
    y = Array.new(Group_array)
    if p2 == "Kait"
      y = Group_array.reject{|p| p == "Brandon"}
    elsif p2 == "Brandon"
      y = Group_array.reject{|p| p == "Kait"}
    elsif p2 == "Andy"
      y = Group_array.reject{|p| p == "Nick"}
    elsif p2 == "Nick"
      y = Group_array.reject{|p| p == "Andy"}
    end
    x = y.reject{|p| p == p2}.sample
    Group_hash[p2.to_sym] = x
    Group_array.delete(x)
  end
end

assign

open('Secret_Pollyanna_Document.txt', 'w') do |f|
  f.puts "First, I promise I haven't opened this,"
  f.puts "I've just instructed the program to write the list into the file, then I sent it your way.\n\n"
  f.puts "Second, I think I correctly programmed it to never give Kait & Brandon to each other,"
  f.puts "or Nick & I to each other, but let me know if I'm wrong\n\n"
  f.puts "The Pollyanna list is as follows: "
  Group_hash.each do |p|
    f.puts "#{p[0].to_s} has #{p[1]}."
  end
end
