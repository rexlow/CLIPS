(defrule addup
  (number ?x)
  (number ?y) => 
  (bind ?total(+ ?x ?y))
  (printout t ?x " + " ?y " = " ?total crlf)
  (assert(total ?total))
)

(assert (number 2)(number 3))

(deftemplate add
  (multislot numbers)
)

(defrule add-3-numbers
  (numbers ?x ?y ?z) =>
  (bind ?total(+ ?x ?y ?z))
  (printout t ?total crlf)
)