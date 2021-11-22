(ns collatz-conjecture)

(defn calc-collatz [num]
  (cond
    (even? num) (/ num 2)
    :else (+ 1 (* 3 num))))

(defn collatz [num & [steps]]
  (cond
    (= 1 num) 0
    :else
    (let [result (calc-collatz num)
          current-step (+ 1 (or steps 0))]
      (if (= 1 result)
        current-step
        (collatz result current-step)))))
