;一条线段和线外一点或者是三个点
(define (make-square-1 point1 point2 point3)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 选择函数１
;;;;;
;矩形的一个高
(define (h-of-square square)
  	())
;矩形的底
(define (b-of-square square)
  	())
;矩形的一个边长
(define (one-side-length square)
  ())
;矩形的另外一个边长
(define (two-side-length square)
  ())

;;;;另外一种选择函数，更好的抽象是给出两条对角线长和夹角，这样周长和面积都可以使用
;;;



;下边两个函数就是使用抽象层的代码部分
(define (len square)
  (* 2 (+
		 (one-side-length square)
		 (two-side-length square))))
(define (area square)
  	(* (h-of-square square)
	   (b-of-square square)))
; 定义函数和选择函数为程序提供了抽象层！！！！
; 上层代码块通过使用选择函数来隔离定义函数所使用
; 的代码细节


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

