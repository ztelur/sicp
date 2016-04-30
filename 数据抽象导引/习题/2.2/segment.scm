
(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
  (let ((start (start-segment segment))
		(end (end-segment segment)))
  (cons (/ (+ (x-point end) (x-point start)) 2)
		(/ (+ (y-point end) (y-point start)) 2) )))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

