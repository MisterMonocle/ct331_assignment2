#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide reduce)
(provide count_instances_deep)

(define (ins_beg el lst)
  (cons el lst))

(define (ins_end el lst)
  (cons lst el))

(define (count_top_level lst)
  (cond ((null? lst) 0)
        ((not (pair? lst))1)
        (else (+ (count_top_level (car lst))
                 (count_top_level (cdr lst))))))
              
(define (count_instances lst el)
      (cond ((null? lst) 0)
          ((= (car lst) el) (+ 1 (count_instances (cdr lst) el)))
          (else (count_instances (cdr lst) el))))

(define (count_instances_tr lst el)
      (cond ((null? lst) 0)
          ((= (car lst) el) (+ 1 (count_instances (cdr lst) el)))
          (else (count_instances (cdr lst) el))))

(define (rev_l a b)
	(cond ( (null? b) a) 
	( else (rev_l (append (list (car b)) a) (cdr b)))))

(define (reduce pair-fn atom-fn el)
  (if (pair? el)
      (pair-fn (reduce pair-fn atom-fn (car el))
               (reduce pair-fn atom-fn (cdr el)))
      (atom-fn el)))

(define (count_instances_deep el)
  (reduce +
            (lambda (atom) 
              (if (not (null? atom))
                  1
                  0))
            el))

(ins_beg 'a'(b c d))
(ins_end '(a b)'(b c d))
(count_top_level '(1 2 3 (4 5) 6))
(count_instances '(1 2 3 2 1 2 3) 2)

(count_instances_deep '(1 (1 1) 1))
