FastPencil
=========

Hi! Thanks for taking the time to look at my solution.  This is the FastPencil excercise I was given, and here are the original requirements with some formatting:

>Requirements
> - Given a list of words, generate two output
files, 'questions' and 'answers'.
> - 'questions' should contain every
sequence of four letters that appear in exactly one word of the
dictionary, one sequence per line.
> - 'answers' should contain the
corresponding words that contain the sequences, in the same order,
again one per line.
> 
>An example, say this is your dictionary:
> - arrows
> - carrots
> - give
> - me

>'questions' would contain:
> - carr
> - give
> - rots
> - rows
> - rrot
> - rrow
> - 'arro' wouldn't show up in 'questions', because it appears in two words

>'answers' would have:
> - carrots
> - give
> - carrots
> - arrows
> - carrots
> - arrows
>
>My Questions:
> - What about numbers and apostrophes?  I could try to skip over them and include 'aint' => 'ain't'
But right now I just skip any fragment that contains an apostrophe.  And same goes for integers.

Version
--------------
Tested with ==> Ruby 2.0.0p451

Installation
--------------
```sh
git clone https://github.com/philcallister/fp_ruby.git
gem install bundler
bundle install
```
Documentation
--------------
Documentation can be found under the __./doc__ directory. The documentation includes the interface to the classes along with various thoughts as to why I did things the way I did.

Tests
--------------
Test specs are written with MiniTest.  The tests run as the default task.
```sh
rake
rake test
```

Run It...
--------------
You can run the solution a couple of different ways. In the original requirements, I wasn't sure how sorting should happen for upper vs. lower, so I added both.  The input file is required, but the defaults for the other options are:
- ignore case for sorting: __true__
- question output file: __questions.out__
- answer output file: __answers.out__
Feel free to change as needed.
Input Files
---
3 input files are available.
- __test_words.txt__ (the original words in the requirements)
- __test_words_case.txt__ (the original words in the requirements with 1 uppercase)
- __words.txt__ (the input file provided with the requirements)

```sh
rake run [test_words.txt,false]
rake run [test_words_case.txt]
rake run [words.txt]
rake run [words.txt,true,false]
```
The output of the solution will be the __questions.out__ file and the __answers.out__ file.  Also, the command line will display benchmark information. 

Thanks!
--------------
Again, thanks for taking a look at my solution.  Please feel free to drop me a line if you have any questions!