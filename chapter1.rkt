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

;; Exercise 1.7
(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average a b)
  (/ (+ a b) 2))

(define (improve-guess guess x)
  (average guess (/ x guess)))

;; should work due to the limited precision of floating point numbers
(define (good-enough? guess x)
 (= guess (improve-guess guess x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve-guess guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Exercise 1.8
(define (improve-guess-cube guess x)
  (/
   (+
    (/ x (square guess))
    (* guess 2))
   3))

(define (good-enough-cube? guess x)
  (= guess (improve-guess-cube guess x)))

(define (cube-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cube-iter (improve-guess-cube guess x) x)))

(define (cube-root x)
  (cube-iter 1.0 x))
