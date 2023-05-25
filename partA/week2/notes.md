## the semantics

- Syntax: is just how you write something
- Semantics: is what that something means

  - Type-checking (before program runs)
  - Evaluation (as program runs)

  - For variable bindings:
    - Type-checking expression and extend static enviroment
    - Evaluete expression and extend dynamic enviroment

## Expressions

We have seen many kinds of expression:

```34 true    false   x   e1+e2   e1<e2

```

Can get arbitrarily large since any subexpression can contain
subsubexpressions, etc.

Every kind of expression has:

- Syntax
- Type-chec rules
  - Produces a type of rails (with a bad error message)
  - types so far: int bool unit
- Evaluation rules (used only on things that type-check)
  - Produces a value (or exception or infinite-loop)

## The REPL

- Read-Eval-Print-Loop is well named

- Can just treat is as a strange/convenient way to run programs

  - but more convenient for quic try-something-out
  - Then move thing over to a testing file for easy reuse

- For reasons discussed in next segment , do not use \*\*\*use\*\* without
  restarting the REPL session
  -(But using it for multiple files at beginning of the session is ok)

## shadowing

Is when you add a variable to an enviroment when before you added it, that
variable was already in the enviroment

#### two reason (either one sufficient)

```sml
val a = 1
val b = a (* b is bound to 1 *)
val a - 2
```

1. Expression in variable bindings are evaluated ¨eagerly¨
   - Before the variable binding ¨finishes¨
   - Afterwards, the expression producing the value is irrelevant
2. There is no way to 'assing to ' a variable in ML
   - Can only shodow it in a later enviroment

## Function Definitions

#### Example

```
(* note: correct only if y>=0 *)

fun pow ( x:int, y:int) -
    if y=0
    then 1
    else x * pow(x,y-1)
```

## function bindings

- Syntax `fun x0 (x1:t1, ...,  xn: tn) = e`

- Evaluation: _A fiunction is a Value_ (Not Evaluation yet)
  - Adds x0 to enviroment so later expression can call it
  - (Function -call semantics wil also allow recursion)
- type-checking
  - Adds binding x0 : ( t1 _ ... _ tn) -> t if:
  - Can type-check body _e_ to have type _t_ in the static enviroment
    containing:
    - "Enclosing" static enviroment (earlier bindings)
    - x: t1, ..., xn :tn (argument with their types)
    - x0 : (t1 _ ... _ tn) -> t (for recursion)
