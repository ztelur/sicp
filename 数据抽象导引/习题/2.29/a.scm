;; 2.29

(define (make-mobile left right)
  (list left right))
(define (make-branch len structure)
  (list len structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))


(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

; 辅助函数
(define (contain_mobile? branch)
  (pair? (branch-structure branch)))
(define (is-right-mobile? mobile)
  (contain_mobile? (right-branch mobile)))
(define (is-left-mobile? mobile)
  (contain_mobile? (left-branch mobile)))

(define (left-structure mobile)
  (branch-structure (left-branch mobile)))
(define (right-structure mobile)
  (branch-structure (right-branch mobile)))

;;;其实你这个编程中就是明显的知道多个层次的信息
;;;你应该不知道子branch的structure是什么
;;;而是只知道左右两个branch，而不是穿过branch再去操作
;;;branch的strucutre！！！
(define (total-weight mobile)
  (cond ((not (pair? mobile))
		  mobile)
		((and (is-left-mobile?  mobile)
		     (is-right-mobile? mobile)) 
         (+ (total-weight (left-structure mobile))
			(total-weight (right-structure mobile))))
		((is-left-mobile? mobile)
		 (+ (total-weight (left-structure mobile))
			(right-structure mobile)))
		((is-right-mobile? mobile)
		 (+ (left-structure mobile)
			(total-weight (right-structure mobile))))
		(else (+ (left-structure mobile)
				 (right-structure mobile)))))

;;; 判断活动体是否平衡
(define (weight branch)
  (* (branch-length branch)
	 (total-weight (branch-structure branch))))
(define (is-balence-inner mobile)
  (= (weight (left-branch mobile))
	 (weight (right-branch mobile))))
(define (is-balence mobile)
  (cond ((not (is-balence-inner mobile)) 
	     (= 1 0))
		((and (is-right-mobile? mobile) 
			  (is-left-mobile? mobile))
		 (and (is-balence (left-structure mobile))
			  (is-balence (right-structure mobile))))
		((is-right-mobile? mobile)
		 (is-balence (left-structure mobile)))
		((is-left-mobile? mobile)
		 (is-balence (right-structure mobile)))
		(else (= 0 0 ))))
;;;;; 网上的做法
(define (branch-weight branch)
  (if (pair? (branch-structure branch))
	(total-weight (branch-structure branch))
	(branch-structure branch)))
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
	 (branch-weight (right-branch mobile))))

