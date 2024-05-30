# Setup:
# gem install stackprof
# brew install graphviz
#
# Text:
# stackprof stackprof.dump
# stackprof stackprof.dump --method 'Task2#work'

# Graphviz
# stackprof stackprof.dump --graphviz > graphviz.dot
# dot -Tpng graphviz.dot -o graphviz.png
# open graphviz.png
#
# Modes:
#  cpu: (default) Sample stack frames (with CPU time)
#  object: Sample stack frames (with object allocations)
#  wall: Sample wall time (real time)

require 'json'
require 'stackprof'
require_relative 'task-2.rb'

StackProf.run(mode: :object, out: 'stackprof_reports/stackprof.dump', raw: true) do
  work
end

# Speedscope
profile = StackProf.run(mode: :object, raw: true) do
  work
end

File.write('stackprof_reports/stackprof.json', JSON.generate(profile))

# Open in browser
puts 'Open in browser: https://www.speedscope.app/ and upload stackprof.json'
