#lang sicp

;; Exercise 1.3
(define (max2 a b)
  (if (> a b) a b))

(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (max3-sum-square a b c)
  (cond ((and (= (max2 a b) a) (= (max2 b c) c)) (sum-square a c))
	((and (= (max2 a b) b) (= (max2 a c) c)) (sum-square b c))
	(else (sum-square a b))))
