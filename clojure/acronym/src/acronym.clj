(ns acronym
  (:require [clojure.string :as str]))

(def break-word-regex #"[A-Z][a-z]+|\w+")

(defn acronym [s]
  (->> (re-seq break-word-regex s)
       (map first)
       (apply str)
       (str/upper-case)))
