(ns cars-assemble)

(def cars-per-hour 221)

(defn fault-chance-for [speed]
  (cond
    (= 0 speed) 1.0
    (and (>= speed 1) (<= speed 4)) 0.0
    (and (>= speed 5) (<= speed 8)) 0.1
    (= 9 speed) 0.2
    (= 10 speed) 0.23))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [cars (* cars-per-hour speed)
        faulty-cars (* (fault-chance-for speed) cars)]
    (- cars faulty-cars)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
