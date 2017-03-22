(defrule take-umbrella
  (or
    (weather raining)
    (weather snowing)
  ) =>
  (assert (umbrella required))
)