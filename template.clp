(deftemplate personal-data
  (slot name)
  (slot age)
  (slot weight)
  (slot height)
  (multislot blood-pressure)
)

(deffacts people
  (personal-data
    (name Johan)
    (age 21)
    (weight 80)
    (height 175)
    (blood-pressure 130 80))
  (personal-data
    (name Johana)
    (age 20)
    (weight 70)
    (height 165)
    (blood-pressure 130 90))
)

/*
.
. Alter facts
.
*/

(defrule birthday "modify Johan's birthday"
  ?birthday <- (birthday ?name)
  ?data-fact <- (personal-data (name ?name) (age ?age)) =>
  (modify ?data-fact (age (+ ?age 1)))
  (retract ?birthday)
)

(defrule weight-loss "minus some weight"
  ?weight-loss <- (weight-loss ?name)
  ?data-fact <- (personal-data (name ?name) (weight ?weight)) =>
  (modify ?data-fact (weight (- ?weight 5)))
  (retract weight-loss)
)

(assert (weight-loss Johan))

/*
.
. Conditional elements in rules
.
*/

(defrule print-ages
  (personal-data (name ?name)(age ?age)) =>
  (printout t ?name " is " ?age " years old." crlf)
)

(defrule print-ages
  (and
      (personal-date (name ?name)(age ?age))
      (personal-date (name ?name)(weight ?weight))
  ) =>
  (printout t ?name " weight " ?weight " at " "age " years old" crlf)
)

(defrule take-an-umbrella
  (or
    (weather raining)
    (weather snowing)
  ) =>
  (printout t "Bring an umbrella" crlf)
)

/*
.
. Logical way of doing truth maintenance
.
*/

(deftemplate personal-data
  (slot name)
  (slot weight)
  (slot age)
  (slot smoker)
  (multislot date-of-birth)
)

(deffacts people
  (personal-data 
    (name adam)
    (weight 60)
    (age 30)
    (smoker no)
    (date-of-birth 18 06 1970)) 
	(personal-data 
    (name brenda)
    (weight 120)
    (age 45)
    (smoker yes)
    (date-of-birth 18 06 1955)) 
	(personal-data 
    (name charles)
    (weight 120)
    (age 60)
    (smoker yes)
    (date-of-birth 18 06 1940)) 
)

(deffacts data (date 18 06 2000))

/*
.
. Test whether a person is overweight and a smoker
.
*/

(defrule cardiac-risk
  (personal-data (name ?name)(weight ?weight)(age ?age)(smoker yes))
  (test (> ?weight 100)) =>
  (assert (cardiac-risk ?name))
)

/*
.
. Create a real-time like rule
.
*/
(defrule cardiac-risk
  (logical (personal-data (name ?name)(weight ?weight)(age ?age)(smoker yes)))
  (logical (test (> ?weight 100))) =>
  (assert (cardiac-risk ?name))
)

(modify 2 (weight 80))