require 'rake/testtask'
Dir["lib/*.rb"].each { |f| require_relative f }

task :default => ['test']

desc "Run FastPencil exercise [optional input and output files]"
task :run, [:input, :out_questions, :out_answers] do |t,args|
  puts "Running FastPencil excercise..."
  abort "EXCEPTION: Required [input] file argument missing." if args[:input].nil?
  args.with_defaults(:out_questions => 'questions.out', :out_answers => 'answers.out')
  Generator.new.process(args[:input], args[:out_questions], args[:out_answers])  
end

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end
