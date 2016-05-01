;习题2.5 ab序对为2^a*3^b,给出cons和car还有cdr的定义

(define (cons1 a b)
  (* (expt 2 a)
	 (expt 3 b)))
; 解法一
(define (num-div n d)
  ;经典递归
  (define (iter x result)
	(if (= 0 (remainder x d))
	  	(iter (/ x d) (+ 1 result))
		result))
  (iter n 0))
(define (car1 a)
  (num-div a 2))
(define (cdr1 a)
  (num-div a 3))

;; 解法二


