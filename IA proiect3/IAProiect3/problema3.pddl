(define (problem berarie)
  (:domain berarie-domain)
  (:objects a b c)
  (:init   (testZ a) (testS b) (testZI c) (testCash a) (testCard b)(testCard c) (=(total-cost) 0))
  (:goal (and (TipBere a) (TipBere b) (TipBereOnline c) ))
  (:metric minimize(total-cost)))