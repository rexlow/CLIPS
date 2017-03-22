(defrule addup
  (number ?x)
  (number ?y) => 
  (bind ?total(+ ?x ?y))
  (printout t ?x " + " ?y " = " ?total crlf)
  (assert(total ?total))
)

(assert (number 2)(number 3))