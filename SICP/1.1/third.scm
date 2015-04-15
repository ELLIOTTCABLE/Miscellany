(define (square x)
  (* x x))

; ‘syntactic sugar’ for,
(define square (lambda (x) (* x x)))

(+ (square 3)
   (square 4))


(define (average x y)
  (/ (+ x y) 2))
(define (mean-square x y)
  (average (square x)
           (square y)))
