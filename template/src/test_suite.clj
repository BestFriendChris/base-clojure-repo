(ns test-suite
  (:use [clojure.test :only (*load-tests* run-tests)]))

(def test-names [])

(defn run []
  (binding [*load-tests* true]
    (let [test-ns (map #(symbol (str "bfc." (name %))) test-names)]
      (apply require :reload-all test-ns)
      (apply run-tests test-ns))))
