(ns anagram
  (:require [clojure.string :refer (lower-case)]))

(defn anagrams-for [target word-list]
  (let [t  (lower-case target)
        st (sort t)]
    (filter #(let [w (lower-case %)]
                (and (not= t w) (= st (sort w))))
            word-list)))
