(defrule test-1
   (declare (salience 99))
   (fire test-1)
   =>
   (printout t "Rule test-1 firing." crlf))
(defrule test-2
   (declare (salience (+ ?*constraint-salience* 10)))
   (fire test-2)
   =>
   (printout t "Rule test-2 firing." crlf))