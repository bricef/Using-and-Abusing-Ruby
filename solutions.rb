#
# Currying
#
# Instead of
# -> a,b {...}[A,B]

# We have to do
# -> a {
#   -> b { ... }
#   }[A][B]

#=============== 1 ==================
#
# Truth
#
T = -> a { -> b { a }}
F = -> a { -> b { b }}

#
# IF
#
IF = -> condition {
      -> consequence {
        -> alternative {
          condition[consequence][alternative]
        }
      }
    }
#
# NOT
#
NOT = -> a{
  a[F][T]
}

#
# AND
#
AND = -> a {
  -> b {
    a[b][F]
  }
}

#
# OR
#
OR = -> a {
  -> b {
    a[T][b]
  }
}

#
# XOR
#
XOR = -> a {
  -> b {
    a[b[F][T]][b]
  }
}

#=============== 2 ==================
#
# PAIR, LEFT, RIGHT
#
PAIR = -> a {
  -> b {
    -> f {
      f[a][b]
    }
  }
}


LEFT = -> pair {
  pair[T]
}

RIGHT = -> pair {
  pair[F]
}

#
# CONS, HEAD, TAIL
#

EMPTY = PAIR[T][T]
IS_EMPTY = LEFT

CONS = -> h {
  -> t {
    PAIR[F][PAIR[h][t]]
    }
}

HEAD = -> l {
  LEFT[RIGHT[l]]
}

TAIL = -> l {
  RIGHT[RIGHT[l]]
}



#=============== 3 ==================
#
# Church Numerals
#

# ZERO
ZERO = -> f {
  -> x { x }
}

# ONE
ONE = -> f {
  -> x {
    f[x]
  }
}

TWO = -> f {
  -> x {
    f[f[x]]
  }
}

THREE = -> f {
  -> x {
    f[f[f[x]]]
  }
}

#=============== 3 ==================

# ADDONE
ADDONE = -> n {
  -> f {
    -> x {
      f[n[f][x]]
    }
  }
}

ADD = -> a {
  -> b {
    b[ADDONE][a]
  }
}


MINUSONE = -> n {
  -> f {
    -> x {
      n[
        ->g{->h{h[g[f]]}}
      ][->u{x}][->u{u}]
    }
  }
}

MINUS = -> a {
  -> b {
    b[MINUSONE][a]
  }
}

ADD_ALT = -> a {
  -> b {
    -> f {
      -> x {
        a[f][b[f][x]]
      }
    }
  }
}

MULT = -> a {
  -> b {
    -> f {
      -> x {
        a[b[f]][x]
      }
    }
  }
}

EXP = -> a {
  -> b {
    b[a]
  }
}

#=============== 4 ==================

# IS_ZERO
IS_ZERO = -> n {
  n[->x{F}][T]
}

#LEQ
LEQ = -> a {
  -> b {
    IS_ZERO[MINUS[a][b]]
  }
}

EQ = -> a {
  -> b {
    AND[LEQ[a][b]][LEQ[b][a]]
  }
}
