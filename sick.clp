(defrule rule_1
  (THE-PATIENT-HAS-A-SORE-THROAT)
  (WE-SUSPECT-A-BACTERIAL-INFECTION) =>
  (assert(WE-BELIEVE-THE-PATIENT-HAS-STREP-THROAT))
  (printout t "We believe the patient has strep throat" crlf))

(defrule rule_2
  (THE-PATIENT-TEMPERATURE-IS-40C) =>
  (assert(THE-PATIENT-HAS-A-FEVER))
  (printout t "We believe the patient has a fever" crlf))

(defrule rule_3
  (THE-PATIENT-HAS-BEEN-SICK-OVER-A-MONTH)
  (THE-PATIENT-HAS-A-FEVER) => 
  (assert(WE-SUSPECT-A-BACTERIAL-INFECTION))
  (printout t "We suspect the patient has a bacterial infection" crlf))

(assert(THE-PATIENT-TEMPERATURE-IS-40C)(THE-PATIENT-HAS-A-SORE-THROAT)(THE-PATIENT-HAS-BEEN-SICK-OVER-A-MONTH))