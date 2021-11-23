(ns pangram
  (:require [clojure.string :as str]))

(def alphabet
  (map str (seq "abcdefghijklmnopqrstuvwxyz")))

(defn build-charset [sentence]
  (->> sentence
       (seq)
       (map str/lower-case)
       (into #{})))

(defn pangram? [sentence]
  (let [char-set (build-charset sentence)]
    (->>
     (map #(contains? char-set %) alphabet)
     (every? true?))))
