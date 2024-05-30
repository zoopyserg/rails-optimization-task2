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
