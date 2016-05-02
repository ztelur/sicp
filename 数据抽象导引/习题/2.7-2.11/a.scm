; 定义区间抽象 习题2.7


(define (make-interval a b) (cons a b))

(define (upper-interval interval) (cdr interval))

(define (lower-interval interval) (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-interval x) (lower-interval y))
				 (+ (upper-interval x) (upper-interval y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-interval x) (lower-interval y)))
		(p2 (* (lower-interval x) (upper-interval y)))
		(p3 (* (upper-interval x) (lower-interval y)))
		(p4 (* (upper-interval x) (upper-interval y))))
	(make-interval (min p1 p2 p3 p4)
				   (max p1 p2 p3 p4))))

; 习题2.8 区间减法
; 区间减法的最小值为x的low-y的upper，最大值应该为x的upper-y的low
(define (sub-interval x y)
  (make-interval (- (lower-interval x) (upper-interval y))
				 (- (upper-interval x) (lower-interval y))))

; 2.10
(define (div-interval-1 x y)
  (if ( > (* (lower-interval y) (upper-interval y)) 0)
	(mul-interval x
				  (make-interval (/ 1.0 (upper-interval y))
								 (/ 1.0 (lower-interval y))))
	(error "Error: not span 0")))

; 2.11
(define (mul-interval-new x y)
  (let ((low-x (lower-interval x))
		(upper-x (upper-interval x))
		(low-y (lower-interval y))
		(upper-y (upper-interval y)))
	(cond ((and (> low-x  0) (> low-y 0 )) 
		   		(make-interval (* low-x low-y) (* upper-x upper-y)))
		  ((and (< upper-x 0) (< upper-y 0)) 
		   		(make-interval (* upper-x upper-y) (* low-x low-y)))
		  ((and (> low-x 0) (and ( > upper-y 0) (< low-y 0)))
		   		(make-interval (* upper-x low-y) (* upper-x upper-y)))
		  ((and (< upper-x 0) (and (> upper-y 0) (< low-y 0)))
		   		(make-interval (* low-x upper-y) (* low-x low-y)))
		  ((and (> low-y 0) (and (> upper-x 0) (< low-x 0)))
		   		(make-interval (* upper-y low-x) (* upper-y upper-x)))
		  ((and (< upper-y 0) (and (> upper-x 0) (< low-x 0)))
		   		(make-interval (* low-y upper-x) (* low-y low-x)))
		  ((and (< upper-x 0) (> low-y 0))
		   		(make-interval (* low-x upper-y) (* upper-x low-y)))
		  ((and (< upper-y 0) (> low-x 0))
		   		(make-interval (* low-y upper-x) (* upper-y low-x)))
		  ( else (make-interval (* low-x low-y) (* upper-x upper-y))))))
(define (test a1 a2 b1 b2)
  (mul-interval-new (make-interval a1 a2)
					(make-interval b1 b2)))
