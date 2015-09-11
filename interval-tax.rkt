;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname interval-tax) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; physical constants

(define LOW 0)
(define INEXPENSIVE 1000)
(define LUXURY 10000)
(define LOW-TAX 0.05)
(define HIGH-TAX 0.08)

; Price -> Number
; computes the amount of tax charged for price p
(define (sales-tax p)
  (cond
    [(and (<= LOW p) (< p INEXPENSIVE)) 0]
    [(and (<= INEXPENSIVE p) (< p LUXURY)) (* LOW-TAX p)]
    [(>= p LUXURY) (* HIGH-TAX p)]))

; test each cond and interval (both inside and each boundary examples)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 8000) (* 0.05 8000))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12017) (* 0.08 12017))
