; reverse list
;

(define (reverse1 li)
  (define (reverse-internal a b n l)
	(if (= n l)
		b
		(reverse-internal a 
						  (cons (list-ref a n) b) 
						  (+ n 1) l)))
  (if (or (null? li) (= (length li) 0))
		  li
		  (reverse-internal li (list ) 0 (length li))))
