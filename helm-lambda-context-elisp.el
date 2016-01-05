(require 'helm-lambda-context)
(require 'eieio)

;; TODO kinda confused on the difference between defvar and setq, figure this out.
(setq helm-lambda-context-elisp
      (make-instance
       'helm-lambda-context
       
       :name
       "ELisp"

       :stringify-listify
       (lambda (data)
         (let ((to-obj-string (lambda (x)
                                (prin1-to-string x))))
           ;;Convert data to a list if not already.
           ;;Convert all elements in list to the string
           ;;representation of its lisp object.
           (if (and (sequencep data) (not (stringp data)))
               (mapcar to-obj-string data)
             (list (funcall to-obj-string data)))))

       :transform-candidates-try
       (lambda (context candidates-all candidates-marked expression)
         (condition-case err
             (funcall
              (slot-value context :transform-candidates)
              context
              candidates-all
              candidates-marked
              expression)
           (error
            ;; TODO Would be useful to have a red/green flash for this
            (my-sp err)
            candidates-all)))

       :transform-candidates
       (lambda (context candidates-all candidates-marked expression)
         (let ((apply-expression (slot-value context :apply-expression)))
           (if (equal nil candidates-marked)
               (mapcar (lambda (candidate)
                         (prin1-to-string
                          (funcall
                           apply-expression
                           expression
                           candidate)))
                       candidates-all)
             (list (prin1-to-string
                    (funcall
                     apply-expression
                     expression
                     candidates-marked))))))
       
       :apply-expression
       (lambda (expression-str x)
         (my-sp x)
         (my-sp (type-of x))
         (let ((expression (read expression-str)))
           (if (and (sequencep x) (not (stringp x)))
               (let* ((xs (mapcar 'read x))
                      (ns (number-sequence 0 (1- (length xs))))
                      (arg-names (mapcar (lambda (n) (intern (concat "%" (int-to-string n)))) ns))
                      (% xs)
                      (f `(lambda ,arg-names ,expression)))
                 (my-sp "applying expression")
                 (my-sp expression)
                 (my-sp "to item")
                 (my-sp xs)
                 (apply (eval f) (append xs nil)))
             (let* ((% (read x)))
               (my-sp "running here")
               (eval expression)))))))

(provide 'helm-lambda-context-elisp)
