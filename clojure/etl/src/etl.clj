(ns etl
  (:require [clojure.string :as str]))

;;; ??
; (defn transform [source]
;   (let [new-mappings (transient {})]
;     (doseq [[points words] source]
;       (doseq [word words] (assoc! new-mappings (str/lower-case word) points)))
;     (persistent! new-mappings)))

(defn transform [source]
  (into {} (for [[score words] source
                 word words]
             [(str/lower-case word) score])))
