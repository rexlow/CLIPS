(defrule ask-sick
  (patient-has-fever) =>
  (printout t "Question: Does the patient sick over a month? [yes/no]" crlf)
  (printout t "Answer [yes/no]: ")
  (assert (patient-sick-over-month(read)))
)