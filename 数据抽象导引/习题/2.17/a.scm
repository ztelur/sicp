; 定义last-pair 返回非空给定表里最后一个元素表

(define (last-pair li)
  (if (null? li)
	0
	(list-ref li (- (length li) 1))))

