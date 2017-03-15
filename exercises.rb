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

  asserts("IF is defined"){ defined? IF}
  asserts("IF[T] will return the consequence"){IF[T][true][false]}
  asserts("IF[F] will return the alternative"){IF[F][false][true]}
end

Riot.context "Pairs" do
  asserts("PAIR exists"){defined? PAIR}
  asserts("LEFT exists"){defined? LEFT}
  asserts("RIGHT exists"){defined? RIGHT}
  asserts("LEFT[PAIR[A][B]] returns A"){to_boolean(LEFT[PAIR[T][F]])}
  asserts("RIGHT[PAIR[A][B]] returns B"){to_boolean(RIGHT[PAIR[F][T]])}
end

Riot.context "Lists" do
  asserts("EMPTY exists"){defined? EMPTY}
  asserts("IS_EMPTY exists"){defined? IS_EMPTY}
  asserts("IS_EMPTY[EMPTY] is true"){to_boolean(IS_EMPTY[EMPTY])}
  asserts("CONS exists"){defined? CONS}
  asserts("IS_EMPTY[CONS[F][EMPTY]] is false"){ not to_boolean(IS_EMPTY[CONS[F][EMPTY]])}
  asserts("HEAD exists"){defined? HEAD}
  asserts("HEAD[CONS[A][EMPTY]] is A"){to_boolean(HEAD[CONS[T][EMPTY]])}
  asserts("TAIL exists"){defined? TAIL}
  asserts("IS_EMPTY[TAIL[CONS[A][EMPTY]]] is true"){to_boolean(IS_EMPTY[TAIL[CONS[F][EMPTY]]])}
  asserts("IS_EMPTY[TAIL[CONS[A][CONS[B][EMPTY]]]] is false"){not to_boolean(IS_EMPTY[TAIL[CONS[T][CONS[T][EMPTY]]]])}
  asserts("HEAD[TAIL[CONS[A][CONS[B][EMPTY]]]] is B"){to_boolean(HEAD[TAIL[CONS[F][CONS[T][EMPTY]]]])}
end

Riot.context "Church numerals" do
  asserts("ZERO applies its function argument no times"){0 == to_integer(ZERO)}
  asserts("ONE applies its function argument once"){1 == to_integer(ONE)}
  asserts("TWO applies its function argument twice"){2 == to_integer(TWO)}
  asserts("THREE applies its function argument thrice"){3 == to_integer(THREE)}
end

Riot.context "Math operators" do
  asserts("ADDONE[ZERO] is 1"){1 == to_integer(ADDONE[ZERO])}
  asserts("ADDONE[ADDONE[ZERO]] is 2"){2 == to_integer(ADDONE[ADDONE[ZERO]])}
  asserts("ADD[ONE][ONE] is 2"){2 == to_integer(ADD[ONE][ONE])}
  asserts("ADD[TWO][TWO] is 4"){4 == to_integer(ADD[TWO][TWO])}
  asserts("MINUSONE[ONE] is 0"){0 == to_integer(MINUSONE[ONE])}
  asserts("MINUSONE[MINUSONE[TWO]] is 0"){0 == to_integer(MINUSONE[MINUSONE[TWO]])}
  asserts("MINUS[ONE][ONE] is 0"){0 == to_integer(MINUS[ONE][ONE])}
  asserts("MINUS[TWO][ONE] is 1"){1 == to_integer(MINUS[TWO][ONE])}
  asserts("MINUS[ONE][TWO] is 0"){0 == to_integer(MINUS[ONE][TWO])}
  asserts("MULT[ONE][ONE] is 1"){1 == to_integer(MULT[ONE][ONE])}
  asserts("MULT[TWO][ONE] is 2"){2 == to_integer(MULT[TWO][ONE])}
  asserts("MULT[TWO][TWO] is 4"){4 == to_integer(MULT[TWO][TWO])}
  asserts("EXP[TWO][THREE] is 16"){16 == to_integer(EXP[TWO][THREE])}
  asserts("EXP[THREE][TWO] is 9"){9 == to_integer(EXP[THREE][TWO])}
end
Riot.alone!
