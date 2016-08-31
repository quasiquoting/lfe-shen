;;; ===================================================== [ Boolean operations ]

(defmacro kl-if (p q r)
  `(if (is_boolean ,p)
     (if p q r)
     (error 'p-not-boolean (list ,p ,q ,r))))

(defmacro kl-or (p q) `(kl-if ,p 'true ,q))

(defmacro kl-and (p q) `(kl-if ,p ,q 'false))

(defmacro kl-cond (`(,p ,q . ,r) `(kl-if ,p ,q (cond ,@r))))

;;; ============================================================ [ Definitions ]

(defmacro kl-lambda (x y) `(lambda (,x) ,y))

(defmacro kl-let (x y z) `(let ((,x ,y)) ,z))

(defmacro kl-freeze (z) `(lambda () ,x))

;;; ================================================================== [ Maths ]

(defun kl-add (x y) (+ x y))

(defun kl-subtract (x y) (- x y))

(defun >? (x y) (> x y))

(defun <? (x y) (< x y))

(defun >=? (x y) (>= x y))

(defun =<? (x y) (=< x y))

;;; ============================================================= [ Predicates ]

(defun number? (n) (is_number n))

(defun cons? ([(cons _ _)] 'true) ([_] 'false))

(defun string? (s) (io_lib:printable_list s))

;;; ==================================================================== [ EOF ]
