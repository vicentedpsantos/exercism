(ns log-levels
  (:require [clojure.string :as str]))

(defn dismember-message
  [s]
  (map str/trim (str/split s #":")))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (second (dismember-message s)))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case
    (str/replace
      (first (dismember-message s)) #"[\[\]]" "")))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (format "%s (%s)" (message s) (log-level s)))
