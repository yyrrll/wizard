#lang racket

(require
  rackunit
  rackunit/text-ui
  )


(define (template)
  '())


(define-test-suite template_test
    (test-case
      ""

      (check-equal?
        (template)
        '()

      (check-equal?
        (template)
        '()

      (check-equal?
        (template)
        '()

      (check-equal?
        (template)
        '()

      ))



(run-tests template_test)
(provide   template_test)
