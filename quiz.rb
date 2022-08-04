require "csv"
require "timeout"

file = CSV.parse(File.read("problems.csv"))
x = file.length


def ask_question(ques, answer, timer)
    puts "New question"
    puts ques
    timeout::timeout(timer) do
        user_ans = gets.chomp
        return user_ans === answer
    end
    rescue Timeout::Error
    return false
end

timer = 5
result = 0

for a in 0..x-1 do
    correct = ask_question(file[a][0],file[a][1],timer)
    result+=1 if correct
end
     
puts "Total Questions   #{x} "
puts "Right Answers     #{result}" 
puts "Wrong Answers     #{x-result}"
