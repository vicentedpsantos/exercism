(ns interest-is-interesting)

(defn interest-rate
  "Returns interest rate based on account balance"
  [balance]
  (cond
    (< balance 0) -3.213
    (> 1000 balance) 0.5
    (> 5000 balance) 1.621
    :else 2.475))

(defn annual-balance-update
  [balance]
  (let [balance-change (* (bigdec (interest-rate balance)) (/ balance 100))]
    (if (neg? balance)
      (- balance balance-change)
      (+ balance balance-change))))

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (if (neg? balance)
    0
    (int (* 2
            (* tax-free-percentage (/ balance 100))))))
