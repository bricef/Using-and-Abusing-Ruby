Using and Abusing Ruby for Computer Science Great Good
======================================================

This Talk/Workshop was given at:

 - The [Sheffield Ruby User Group](https://shrug.org/) on 2017-03-13
 - The [Cambridge Programmer's Study Group](https://www.meetup.com/Cambridge-Programmers-Study-Group/) on 2017-03-15

 You can get the latest slides [here](https://github.com/bricef/Using-and-Abusing-Ruby/blob/master/Using-and-Abusing-Ruby.pdf).

 This ~~owes a lot to~~ is basically stolen from Chapter 6 of [Understanding Computation](http://computationbook.com/) by [Tom Stuart](https://twitter.com/tomstuart). It's a great book and worthy of your time. It goes into a lot more detail than this talk does, including showing how to add some of the bits that were skipped for this talk, such as recursion.

 The [Wikipedia page on Church Encoding](https://en.wikipedia.org/wiki/Church_encoding) is also a great companion to this talk, although it contains spoilers for the exercises. It provides some alternative solutions to the problems, and shows you how to derive some of the trickier solutions, like `MINUSONE`.

Requirements
------------
You will need a recent version of [Ruby](https://www.ruby-lang.org/) installed and to be able to run command on the terminal or Windows prompt. Take a look at the [Ruby Quickstart](https://www.ruby-lang.org/en/documentation/quickstart/) if you're having trouble.

You don't need to know ruby to follow this talk :)

Running `irb` in your terminal should bring you to a ruby prompt.

If you want to use the unit tests in this repository, you will need to install the dependencies. To do this you will need to have [Bundler](http://bundler.io/) installed, and run `bundle install` in the root of the repository. It is recommended that you install the dependencies locally by specifying a path:

    ➤ bundle install --path vendor/bundle


Using this repository
---------------------

Once you have the dependencies installed, start an `irb` session in the root of this project, and load the exercises by running `load "./exercises.rb"`:

    irb(main):001:0> load "./exercises.rb"
    => true

Now, just run the `test` method to run the unit tests. They will guide you through all the exercises.

I have included possible solutions in the `solutions` branch, but I would highly recommend at least trying to solve the problems yourself before taking a look. The insight gained in figuring out some of these problems on your own – and the feeling of joy when you do – can't be gained by looking at a solution.

The `MINUSONE` function is tricky, and will take some thinking.
