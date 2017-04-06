(defrule ask-sick
  (patient-has-fever) =>
  (printout t "Question: Does the patient sick over a month? [yes/no]" crlf)
  (printout t "Answer [yes/no]: ")
  (assert (patient-sick-over-month(read)))
)


//simple if  then else
(defrule ask-sick
  (patient-has-fever) =>
  (printout t "Question: Does the patient sick over a month? [yes/no]: ")
  (bind ?input (readline))
  (if (neq ?input "no")
    then
      (printout t "Do not worry, we will fix him" crlf)
    else 
      (printout t "No prob" crlf)
  )
)

// make user input as facts until input=end
(deffacts start
  (get-next-input)
)

(defrule get-input
  ?fact <- (get-next-input) =>
  (printout t "Input (end to stop)? ")
  (bind ?input (readline))
  (if (neq ?input "end") 
    then 
      (retract ?fact)
      (assert (get-next-input))
      (assert (user-input ?input))
  )
)