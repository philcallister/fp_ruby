require 'rake/testtask'
require 'benchmark'
Dir["lib/*.rb"].each { |f| require_relative f }

task :default => ['test']

desc "Run FastPencil exercise [optional ignore case and output files]"
task :run, [:input, :ignore_case, :out_questions, :out_answers] do |t,args|
  puts "Running FastPencil excercise..."
  abort "EXCEPTION: Required [input] file argument missing." if args[:input].nil?
  args.with_defaults(:ignore_case => true, :out_questions => 'questions.out', :out_answers => 'answers.out')
  Benchmark.bm do |x|
    x.report { Generator.new.process(args[:input], args[:out_questions], args[:out_answers], args[:ignore_case]) }
  end
end

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end
