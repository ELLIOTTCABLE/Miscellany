### Exercise 1.1
    10                              ;  10
    (+ 5 3 4)                       ;  12
    (- 9 1)                         ;  8
    (/ 6 2)                         ;  3
    (+ (* 2 4) (- 4 6))             ;  6
    (define a 3)                    ;  ¯\_ (ツ)_/¯
    (define b (+ a 1))              ;  ¯\_ (ツ)_/¯
    (+ a b (* a b))                 ;  19
    (= a b)                         ;  #f
    (if (and (> b a) (< b (* a b))) ;
        b                           ;
        a)                          ;  4
    (cond ((= a 4) 6)               ;
          ((= b 4) (+ 6 7 a))       ;
          (else 25))                ;  16
    (+ 2 (if (> b a) b a))          ;  6
    (* (cond ((> a b) a)            ;
             ((< a b) b)            ;
             (else -1))             ;
       (+ a 1))                     ;  16

### Exercise 1.2
    (/
       (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
       (* 3 (- 6 2) (- 2 7)))

### Exercise 1.3
Laborious approach, but we don't have the tools yet, afaict ...

    (define (on-largest-of op a b c)
       (cond ((and (< c b) (< c a)) (op a b))
             ((and (< b c) (< b a)) (op a c))
             ((and (< a b) (< a c)) (op b c))))

    (define (sum-squares a b)
       (+ (* a a) (* b b)))

    (define (sum-squares-of-largest a b c)
       (on-largest-of sum-squares a b c))

### Exercise 1.4
b is tested to be positive or negative, and they are either added or sutracted as necessary to
maintain a positive result.

### Exercise 1.5
In normal-order evaluation, the interpreter will have to actually attempt to expand the
infinitely-recursive function `p`:

    (test 0 (p))
    (test 0 (p))
    (test 0 (p))
    ; ... and so on.

A real interpreter, however, won't attempt to evaluate `(p)` until it needs to, which, in this case,
it won't:

    (test 0 (p))
    (if (= 0 0) 0 (p))
    (if #t 0 (p))
    0

Presumably, a normal-order interpreter would never terminate in this case, unless it detected such
cases heuristically.

### Exercise 1.6
`#noidea`

### Exercise 1.7
The difference between a very, very small number and the predicted result will always been very,
very small; and without a smaller ‘tolerance,’ the algorithm will cease attempting to improve it
even if it's radically distant in percentage terms. (For instance, `(sqrt 0.00001)` yields
0.03135, when the real answer is something closer to 0.00316. Off by an order of magnitude.)

As for large numbers, blahblahblah something IEEE floats blah `#noidea`

    (define (good-enough? previous current)
      (< (abs (- previous current))
         (/ current 100000)))

    (define (sqrt-iter previous current x)
      (if (good-enough? previous current)
          current
          (sqrt-iter current (improve current x) x)))

    (define (sqrt x)
      (sqrt-iter 0.0 1.0 x))
