;这里是注释啊
;问题描述
; if n < 3  f(n) = n; if n >=3 f(n)=f(n-1)+2f(n-2)+3f(n-3) 
; 请使用递归计算过程和迭代过程分别完成
; 递归过程
(define (f n)
  (cond ( (< n 3) n)
		( else (+ (f (- n 1))
				  (* 2 (f (- n 2)))
				  (* 3 (f (- n 3)))
				  )
			   )))
;迭代过程
; 1 --> 1
; 2 --> 2
; 3 --> 4
; f1(4)
; 
;
(define (f1 n) (f1-inter )
(define (f1-inter first second third total  i  n) 
  (cond ((< i 3) i)
		(else (+ first (* 2 second) (* 3 third)))
   ))
(f 4)
