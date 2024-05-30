require 'memory_profiler'
require_relative 'task-2.rb'

MemoryProfiler.start
work
report = MemoryProfiler.stop

report.pretty_print(scale_bytes: true)
