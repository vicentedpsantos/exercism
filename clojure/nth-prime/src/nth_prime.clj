(ns nth-prime)

(declare prime?)

(defn nth-prime [n] ;; <- arglist goes here
  (when (not (pos? n))
    (throw (IllegalArgumentException. "There is no zeroth prime.")))
  (nth (filter prime? (iterate inc 2)) (dec n)))

(defn prime? [n]
  (loop [divisor 2]
    (cond (> (* divisor divisor) n) true
          (zero? (rem n divisor)) false
          :else (recur (inc divisor)))))
