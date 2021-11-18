(ns armstrong-numbers
  (:require [clojure.string :as str]))

(defn number-digits [num]
  (map read-string (str/split (str num) #"")))

(defn- expt [base n]
  (apply * (repeat n base)))

(defn armstrong? [num]
  (let [number-digits (number-digits num)
        digits-count (count number-digits)]
    (= (reduce #(+ %1 (expt %2 digits-count)) 0 number-digits) num)))
