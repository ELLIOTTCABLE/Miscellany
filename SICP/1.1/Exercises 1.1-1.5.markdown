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
b is tested ...
