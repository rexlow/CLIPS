(defrule rule1
(The-patient-has-a-sore-throat)
(We-suspect-a-bacterial-infection) =>
(assert (We-believe-the-patient-has-strep-throat)))


(defrule rule2
(The-patient-temperature-is-40C) =>
(assert (The-patient-has-a-fever)))


(defrule rule3
(The-patient-has-been-sick-over-a-month)
(The-patient-has-a-fever) =>
(assert (We-suspect-a-bacterial-infection))
(printout t"We suspect a bacterial infection" crlf))

(defrule rule4
(The-patient-has-a-fever) =>
(assert (The-patient-cannot-go-to-a-class)))

(defrule rule5
(The-patient-cannot-go-to-a-class) =>
(assert (The-patient-should-stay-home-and-read-a-book))
(printout t" The patient should stay home and read a book" crlf))

(assert (The-patient-temperature-is-40C)(The-patient-has-a-sore-throat)(The-patient-has-been-sick-over-a-month))