(define (fringe tree)
  (cond ((null? tree) null)
		((pair? tree) 
		    (append (fringe (car tree)) (fringe (cdr tree))))
		(else list(tree))))

