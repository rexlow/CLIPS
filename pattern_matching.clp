(deffacts startup 
  (animal dog)    
  (animal cat)   
  (animal duck)   
  (animal turtle) 
  (warm-blooded dog)   
  (warm-blooded cat) 
  (warm-blooded duck) 
  (lays-eggs duck) 
  (lays-eggs turtle) 
  (child-of dog puppy) 
  (child-of cat kitten) 
  (child-of turtle hatchling)
)

(reset)

(defrule animal
  (animal ?) =>
  (printout t "animal found" crlf)
)

(defrule list-animals 
  (animal ?name) => 
  (printout t ?name " found" crlf)
)

(defrule mammal
	(animal ?name)
	(warm-blooded ?name)
	(not (lays-eggs ?name)) 
  => 
	(assert (mammal ?name))
	(printout t ?name " is a mammal" crlf)
)


(defrule mammal2
  (mammal ?name)
  (child-of ?name ?young) =>
  (assert (mammal ?young))
  (printout t ?young " is a mammal" crlf)
)