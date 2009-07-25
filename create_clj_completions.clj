(when (empty? *command-line-args*)
  (println "Must supply location to put .clj_completions file")
  (System/exit 1))

(def file-location (str (nth *command-line-args* 0) "/.clj_completions"))

(defmacro with-out-file [pathname & body]
  `(with-open [s# (java.io.FileWriter. ~pathname)]
     (binding [*out* s#]
       ~@body)))

(def completions (keys (ns-publics (find-ns 'clojure.core))))
(with-out-file file-location
  (doseq [x completions]
    (println x)))
