1. Set up memory profilers:
- stackprof
- memory_profiler
- ruby-prof
- flamegraph
- (todo) valgrind
2. Copied CPU-optimized code from https://github.com/zoopyserg/rails-optimization-task1/pull/1
3. Run all profilers and analyze the memory bottlenecks:
- ruby-prof - OK
- flamegraph - OK but slower than ruby-prof + the report takes long to open
- memory_profiler - too slow, very long feedback loop, skipping for future tasks
- stackprof - worked on small data set but failed to write json on large data set
4. Using ruby-prof + qcachegrind as the only reliable & fast profiler. Analyzing data from ruby-prof.
5. Added all reports to .gitignore because of their enourmous size.
6. Total RAM usage is 6Gb. The biggest memory bottlenecks are:
- CSV internal methods (each, open, etc)
- collect_all_stats method (which does array#each => array#map multiple times)
7. Focusing on collect_all_stats.
- used vars outside the loop
- removed map calls inside the loop
- confirmed that the tests still pass
This trimmed RAM usage from 6Gb to 1.5Gb.
8. Running ruby-prof again showed that the next bottlenecks are Date.parse and Date.iso8601 methods.
- swapped Date.parse with Date.strptime (more efficient)
- swapped Date.iso8601 with manual string concatenation
- removed all variables I could
This dropped usage from 1.5Gb to 246Mb.

At this poiint all the bottlenecks are inside ruby CSV library.
Stopping here.

Total result of RAM usage optimization: 6Gb -> 246Mb
