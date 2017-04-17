(deftemplate student-data 
	(slot name) 
	(slot idNum) 
	(slot semester) 
	(slot gpa) 
	(slot cgpa) 
)

(deffacts stdent 
	(student-data  (name Johan) (idNum 1) (semester 1) (gpa 3.1) (cgpa 3.2))
	(student-data  (name Joanne) (idNum 2) (semester 3) (gpa 3.2) (cgpa 3.3))
	(student-data  (name Adam) (idNum 3) (semester 4) (gpa 3.3) (cgpa 4.0))
	(student-data  (name Siti) (idNum 4) (semester 2) (gpa 3.5) (cgpa 3.9))
	(student-data  (name Brenda) (idNum 5) (semester 2) (gpa 3.6) (cgpa 3.75))
	(student-data  (name Alice) (idNum 6) (semester 4) (gpa 3.4) (cgpa 2.9))
	(student-data  (name Luke) (idNum 7) (semester 4) (gpa 2.0) (cgpa 1.8))
	(student-data  (name Jasmine) (idNum 8) (semester 5) (gpa 3.9)  (cgpa 3.5 ))
	(student-data  (name Jessie) (idNum 9) (semester 6) (gpa 3.4) (cgpa 3.4))
	(student-data  (name Yoda) (idNum 10) (semester 7) (gpa 3.0) (cgpa 3.1))
)

(defrule print-cgpa 
	(student-data (name ?name)  (cgpa ?cgpa))
	(test(> ?cgpa 3.75)) => 
	(printout t ?name " has cgpa of " ?cgpa  crlf) 
)

(defrule print-dean-list 
	(student-data (name ?name)  (gpa ?gpa))
	(test(> ?gpa 3.5)) => 
	(printout t ?name " is in dean list." crlf) 
)
