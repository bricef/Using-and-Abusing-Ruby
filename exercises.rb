require "rubygems"
require "bundler/setup"
require "riot"




class Something
end

class SomethingElse
end

def to_boolean(proc)
  proc[true][false]
end

def to_integer(proc)
  proc[-> n {n+1}][0]
end

def test
  Riot.run
  nil
end

Riot.context "Boolean" do
  asserts("T is defined"){
    defined? T
  }
  asserts("T will return the first argument") {
    first = Something.new
    T[first][false] === first
  }

  asserts("F is defined"){
    defined? F
  }
  asserts("F will return the first argument") {
    second = Something.new
    F[false][second] === second
  }
end

Riot.context "Boolean logic" do
  asserts("AND is defined"){ defined? AND }
  asserts("AND[T][F] is false"){ not to_boolean(AND[T][F]) }
  asserts("AND[F][F] is false"){ not to_boolean(AND[F][F]) }
  asserts("AND[F][T] is false"){ not to_boolean(AND[F][T]) }
  asserts("AND[T][T] is true"){ to_boolean(AND[T][T]) }

  asserts("OR is defined"){ defined? OR }
  asserts("OR[T][F] is true"){ to_boolean(OR[T][F]) }
  asserts("OR[F][F] is false"){ not to_boolean(OR[F][F]) }
  asserts("OR[F][T] is true"){ to_boolean(OR[F][T]) }
  asserts("OR[T][T] is true"){ to_boolean(OR[T][T]) }

  asserts("NOT is defined"){ defined? NOT }
  asserts("NOT[T] is false"){ not to_boolean(NOT[T])}
  asserts("NOT[F] is true"){ to_boolean(NOT[F])}


end


Riot.alone!
