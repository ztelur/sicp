(define (for-each1 proc items)
  (cond ((null? items) #t)
	(else (proc (car items))
	 (for-each1 proc (cdr items)))))
