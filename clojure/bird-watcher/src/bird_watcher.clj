(ns bird-watcher)

(def last-week 
  '[0 2 5 3 7 8 4])

(def birds-per-day
  '[2 5 0 7 4 1])

(defn today [birds]
  (last birds))

(defn inc-bird [birds]
  (let [incremented (+ (last birds) 1)]
    (conj (pop birds) incremented)))

(defn day-without-birds? [birds]
  (= (some #{0} birds) 0))

(defn n-days-count [birds n]
  (let [first-day 0]
    (reduce + (subvec birds first-day n))))

(defn busy-days [birds]
  (count (filter #(>= %1 5) birds)))

(defn odd-week? [birds]
  (= [1 0 1 0 1 0 1] birds))
