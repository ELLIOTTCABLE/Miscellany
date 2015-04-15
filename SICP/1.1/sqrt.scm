(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (/
    (+ (* 2 guess) (/ x (square guess)))
    3))

(define (good-enough? previous current)
  (< (abs (- previous current)) (/ current 100000)))

(define (cbrt-iter previous current x)
  (if (good-enough? previous current)
      current
      (cbrt-iter current (improve current x) x)))

(define (cbrt x)
  (cbrt-iter 0.0 1.0 x))

(display (cbrt 9))      (newline)
(display (cbrt 1000))   (newline)
(display (cbrt 56789876543210))(newline)
(display (cbrt 0.00001))(newline)
