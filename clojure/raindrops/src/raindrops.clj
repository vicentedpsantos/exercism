(ns raindrops)

(defn sound? [x num]
  (->> x
       (rem num)
       zero?))

(defn convert [num]
  (cond-> nil
    (sound? 3 num) (str "Pling")
    (sound? 5 num) (str "Plang")
    (sound? 7 num) (str "Plong")
    :always (or (str num))))
