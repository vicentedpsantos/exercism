(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [deck]
  (first deck))

(defn second-card
  "Returns the second card from deck."
  [deck]
  (second deck))

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [deck]
  (concat (reverse (take 2 deck)) (drop 2 deck)))

(defn discard-top-card
  "Returns a vector containing the first card and
   a vector of the remaining cards in the deck."
  [[head & tail]]
  [head tail])

(def face-cards
  ["jack" "queen" "king"])

(defn list-insert [lst elem-list index]
  (let [[l r] (split-at index lst)]
    (concat l [elem-list] r)))

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [deck]
  (flatten (list-insert deck face-cards 1)))
