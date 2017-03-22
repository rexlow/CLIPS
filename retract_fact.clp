(defrule remove-mammal
  ?fact <- (mammal ?)
  (child-of ?name ?young) =>
  (printout t "retracting " ?fact crlf)
  (retract ?fact)
)