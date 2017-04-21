(defrule poke-fun-at-smokers 
	(declare (salience 10))
	(personal-data (name ?name)(smoker yes)) => 
	(printout t ?name " is a fool." crlf)) 

(defrule worry-about-thin-people 
	(declare (salience 20))
	(personal-data (name ?name)(weight ?weight)) 
	(test (< ?weight 80)) => 
	(printout t ?name " is looking a bit thin." crlf))
