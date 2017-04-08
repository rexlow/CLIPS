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


/*
. 
. Advance version
. Without the need of if-else
. loop through the rules instead
.
. implode$ is use to create a new string
. lexemep function returns the symbol TRUE if its argument is a string or symbol, otherwise it returns the symbol FALSE.
.
*/

(deffunction ask-question (?question $?allowed-values)
   (printout t "Q: " ?question " [" (implode$ ?allowed-values) "] " )
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t "Q: " ?question " [" (implode$ ?allowed-values) "] " )
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no (?question)
  (ask-question ?question yes no))

(defrule ask-temperature =>
  (bind ?input (yes-or-no "Is the patient's temperature more than 39?"))
  (assert (THE-PATIENT-TEMPERATURE-IS-40C ?input)))

(defrule ask-sick-for-over-a-month
   (THE-PATIENT-HAS-A-FEVER yes) =>  
   (bind ?input (yes-or-no "Does the patient sick over a month?"))
   (assert (THE-PATIENT-HAS-BEEN-SICK-OVER-A-MONTH ?input)))

(defrule ask-sore-throat
   (WE-SUSPECT-A-BACTERIAL-INFECTION yes) =>
   (bind ?input (yes-or-no "How about sore throat?"))
   (assert (THE-PATIENT-HAS-A-SORE-THROAT ?input)))

(defrule conclude-fever
  (THE-PATIENT-TEMPERATURE-IS-40C yes) =>
  (assert (THE-PATIENT-HAS-A-FEVER yes))
  (printout t "The patient has fever" crlf))

(defrule conclude-bacterial-infection
  (THE-PATIENT-HAS-BEEN-SICK-OVER-A-MONTH yes)
  (THE-PATIENT-HAS-A-FEVER yes) => 
  (assert (WE-SUSPECT-A-BACTERIAL-INFECTION yes))
  (printout t "We suspect the patient has bacterial infection" crlf))

(defrule conclude-strep-throat
  (THE-PATIENT-HAS-A-SORE-THROAT yes)
  (WE-SUSPECT-A-BACTERIAL-INFECTION yes) =>
  (assert (WE-BELIEVE-THE-PATIENT-HAS-STREP-THROAT yes))
  (printout t "We believe the patient has strep throat" crlf))