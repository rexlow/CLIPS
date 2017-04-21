(defrule start-question
  (ask-question) =>
  (printout t "Is the starter turning [yes/no]: ")
  (assert (STARTER-TURNING (read))))

(defrule starter-turning
  (STARTER-TURNING yes) =>
  (assert (GOT-PETROL)))

(defrule starter-turning
  (STARTER-TURNING no) =>
  (assert (LIGHTS-WORKING)))

(defrule got-any-petrol
  (GOT-PETROL) =>
  (printout t "Got any petrol [yes/no]: ")
  (assert (GOT-PETROL (read))))

(defrule got-any-petrol
  (GOT-PETROL yes) =>
  (printout t "Please call the AA" crlf))

(defrule got-any-petrol
  (GOT-PETROL no) =>
  (printout t "Please buy some battery" crlf))

(defrule lights-working
  (LIGHTS-WORKING) =>
  (printout t "Is the light working [yes/no]: ")
  (assert (LIGHTS-WORKING (read))))

(defrule lighs-working
  (LIGHTS-WORKING yes) =>
  (assert (SOLENOID-CLICK)))

(defrule lighs-working
  (LIGHTS-WORKING no) =>
  (printout t "Please charge the battery" crlf))

(defrule solenoid-click
  (SOLENOID-CLICK) =>
  (printout t "Is the solenoid clicking [yes/no]: ")
  (assert (SOLENOID-CLICK (read))))

(defrule solenoid-click
  (SOLENOID-CLICK yes) =>
  (assert (TERMINAL-CLEAN)))

(defrule solenoid-click
  (SOLENOID-CLICK no) =>
  (assert (SOLENOID-FUSE)))

(defrule terminal-clean
  (TERMINAL-CLEAN) =>
  (printout t "Is the terminal clean [yes/no]: ")
  (assert (TERMINAL-CLEAN (read))))

(defrule terminal-clean
  (TERMINAL-CLEAN yes) =>
  (printout t "Please replace the started" crlf))

(defrule terminal-clean
  (TERMINAL-CLEAN no) =>
  (printout t "Please clean the terminal" crlf))

(defrule solenoid-fuse
  (SOLENOID-FUSE) =>
  (printout t "Is the solenoid fuse working [yes/no]: ")
  (assert (SOLENOID-FUSE (read))))

(defrule solenoid-fuse
  (SOLENOID-FUSE yes) =>
  (printout t "Please replace the solenoid" crlf))

(defrule solenoid-fuse
  (SOLENOID-FUSE no) =>
  (printout t "Please replace the fuse" crlf))
