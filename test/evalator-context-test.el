;;; evalator-context-test.el --- 
;; 
;; Author: Sean Irby
;; Copyright © , Sean Irby
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; This file is not a part of GNU Emacs
;; 
;;; Commentary:
;; 
;;; Code:

(require 'el-mock)
(eval-when-compile
  (require 'cl))

(require 'evalator-context)

;; (ert-deftest evalator-context-get-test ()
;;   (let ((evalator-elisp-context      "elisp")
;;         (evalator-foo-context        "foo")
;;         (evalator-mode-context-alist '((foo-mode . evalator-foo-context))))
;;     (with-mock
;;      (stub buffer-local-value)
;;      (should (equal "foo"
;;                     (evalator-context-get 'evalator-foo-context))))
;;     (with-mock
;;      (stub buffer-local-value => 'foo-mode)
;;      (should (equal "foo"
;;                     (evalator-context-get))))
;;     (with-mock
;;      (stub buffer-local-value => 'bar-mode)
;;      (should (equal "elisp"
;;                     (evalator-context-get))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; evalator-context-test.el ends here
