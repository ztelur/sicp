(define (square-list item)
  (if (null? item)
		nil
		(cons (* (car item) (car item))
			  (square-list (cdr item)))))
(define (square-list-1 item)
  (map (lambda (x) (* x x))
	   item))
