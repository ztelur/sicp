(define (append1 list1 list2)
  (if (null? list1) list2
	  (cons (car list1) (append1 (cdr list1) list2))))

(define (reverse1 items)
  (if (null? items) items
	(append (reverse1 (cdr items) (list (car items))))))


(define (deep-reverse items)
  (cond ((null? items) null)
		((pair? (car items))
		 (append (deep-reverse (cdr items))
				 (list (deep-reverse (car items)))))
		(else
		  (append (deep-reverse (cdr items))
				  (list (car items))))))

