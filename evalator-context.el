(require 'eieio)

(defvar evalator-context-special-arg-default "Ⓔ") ;; x24ba

;; References to data types in the docstrings below are assumed to be elisp types.
(defclass evalator-context ()
  ((name
    :initarg :name
    :custom string
    :documentation
    "Name of the evaluation context (elisp, cider, etc..)")

   (init
    :initarg :init
    :custom function
    :documentation
    "Performs any setup needed before any context evaluation functions
    are called. All functions below are context evaluation functions.")

   (make-candidates
    :initarg :make-candidates
    :custom function
    :documentation
    "Function evaluates the input data and transforms it so that it
    can be used as the ':candidates' argument for building a helm
    source. Function should accept a string or list of strings.
    Function should return a list of strings")

   (transform-candidates
    :initarg :transform-candidates
    :custom function
    :documentation
    "Function that applies an expression over a selection of
    candidates.  If no candidates are marked, then the selection will
    be all candidates.  Otherwise, the selection will be the marked
    candidates.  Function should accept all current candidates, all
    marked candidates, and an expression string as arguments. Function
    should return a list of strings.  Function should throw an error
    if the transformation fails.")))

(provide 'evalator-context)
