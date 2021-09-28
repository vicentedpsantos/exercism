(ns sublist
  (:import [java.util Collections]))

(defn- sublist? [list1 list2]
  "Returns whether or not list2 is a sublist of list1"
  (let [index (Collections/indexOfSubList list1 list2)]
    (cond
      (>= index 0) true
      (< index 0) false)))

(defn classify [list1 list2]
  (cond
    (= list1 list2) :equal
    (sublist? list1 list2) :superlist
    (sublist? list2 list1) :sublist
    :else :unequal)
)
