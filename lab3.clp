(deftemplate student-form
  (slot name)
  (slot id)
  (multislot semester)
  (multislot gpa)
  (slot cgpa)
)

(deffacts student
  (student-form
    (name John)
    (id 001)
    (semester 1 2 3)
    (gpa 3.00 2.50 3.45)
    (cgpa )
  )
)