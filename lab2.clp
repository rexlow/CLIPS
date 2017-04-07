(defrule rule_1
  (THE-PATIENT-HAS-A-SORE-THROAT)
  (WE-SUSPECT-A-BACTERIAL-INFECTION) =>
  (assert(WE-BELIEVE-THE-PATIENT-HAS-STREP-THROAT))
  (printout t "We believe the patient has strep throat" crlf))

(defrule rule_2
  (THE-PATIENT-TEMPERATURE-IS-40C) =>
  (assert(THE-PATIENT-HAS-A-FEVER)))

(defrule rule_3
  (THE-PATIENT-HAS-BEEN-SICK-OVER-A-MONTH)
  (THE-PATIENT-HAS-A-FEVER) => 
  (assert(WE-SUSPECT-A-BACTERIAL-INFECTION)))

(defrule ask-sick
  (start-question) =>
  (printout t "Q: Is the patient's temperature more than 39? [yes/no]: ")
  (bind ?input (readline))
  (if (neq ?input "no")
    then
      (assert (THE-PATIENT-TEMPERATURE-IS-40C))
      (printout t "The patient has fever" crlf)
      (printout t "Q: Does the patient sick over a month? [yes/no]: ")
      (bind ?input2 (readline))
      (if (neq ?input2 "no")
        then
          (assert (THE-PATIENT-HAS-BEEN-SICK-OVER-A-MONTH))
          (printout t "We suspect the patient has bacterial infection" crlf)
          (printout t "Q: How about sore throat? [yes/no]: ")
          (bind ?input3 (readline))
          (if (neq ?input3 "no")
            then
              (assert (THE-PATIENT-HAS-A-SORE-THROAT))
          )
      )
  )
)

(deffacts start
  (start-question)
)
