(ns pangram
  (:require [clojure.string :as str]))

(def alphabet (set "abcdefghijklmnopqrstuvwxyz"))

(defn build-charset [sentence]
  (->> sentence
       str/lower-case
       set))

(defn pangram? [sentence]
  (let [charset (build-charset sentence)]
    (-> charset
        (every? alphabet))))
