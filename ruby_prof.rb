# Setup:
# gem install ruby-prof
# brew install graphviz
# brew install qcachegrind
#
# Modes:
# ALLOCATIONS: Sample object allocations
# WALL_TIME: Sample wall time (real time)
# CPU_TIME: Sample CPU time
#
# Usage:
# ruby ruby_prof.rb
# qcachegrind ruby_prof_reports/callgrind.out.12345

require 'ruby-prof'
require_relative 'task-2.rb'

# Modes:
# ALLOCATIONS: Sample object allocations
# MEMORY: Sample memory usage

RubyProf.measure_mode = RubyProf::MEMORY

result = RubyProf.profile do
  work
end

printer = RubyProf::FlatPrinter.new(result)
printer.print(File.open('ruby_prof_reports/ruby_prof.txt', 'w+'))

# printer = RubyProf::DotPrinter.new(result)
# printer.print(File.open('ruby_prof_reports/ruby_prof.dot', 'w+'))

printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open('ruby_prof_reports/ruby_prof.html', 'w+'))

printer = RubyProf::CallStackPrinter.new(result)
printer.print(File.open('ruby_prof_reports/ruby_prof_callstack.html', 'w+'))

# for callgrind
printer = RubyProf::CallTreePrinter.new(result)
printer.print(path: 'ruby_prof_reports', profile: 'callgrind')
