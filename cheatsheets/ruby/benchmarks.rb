## benchamarking and profiling

time ruby script.rb

n = 5_000_000
Benchmark.bm(15) do |x|
  x.report("for loop:")   { for i in 1..n; a = "1"; end }
  x.report("times:")      { n.times do   ; a = "1"; end }
  x.report("upto:")       { 1.upto(n) do ; a = "1"; end }
end

#The bmbm method runs your benchmarking code twice
#The first run is called the rehearsal
Benchmark.bmbm(15) do |x|
  x.report("for loop:")   { for i in 1..n; a = "1"; end }
  x.report("times:")      { n.times do   ; a = "1"; end }
  x.report("upto:")       { 1.upto(n) do ; a = "1"; end }
end

#measures time
puts Benchmark.measure { "foo" << "bar" << "baz" }

ruby -r profile script.rb > /dev/null

ruby script_with_benchmarks.rb 2> /dev/null # use $stderr.puts



When using the various finders make sure to provide the right options to select only the fields required (:select)

Top 10 Ruby on Rails performance tips

