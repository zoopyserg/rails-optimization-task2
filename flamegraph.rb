require 'flamegraph'
require_relative 'task-2.rb'

Flamegraph.generate('flamegraph.html') do
  work
end
