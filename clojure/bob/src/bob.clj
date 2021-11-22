(ns bob
  (:require [clojure.string :as str]))

(defn is-question? [s]
  (str/ends-with? (str/trim s) "?"))

(defn is-yelling? [s]
  (let [text (re-find #"[A-Za-z]" s)]
    (if text
      (= (str/upper-case s) s)
      false)))

(defn is-silence? [s]
  (str/blank? (str/trim s)))

(defn response-for [s]
  (cond
    (and (is-question? s) (is-yelling? s)) "Calm down, I know what I'm doing!"
    (is-silence? s) "Fine. Be that way!"
    (is-question? s) "Sure."
    (is-yelling? s) "Whoa, chill out!"
    :else "Whatever."))
