;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname check-expect) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
; Number -> Number
; converts Fahrenheit temperature to Celsius temperature
; given 32, expect 0
; given 212, expect 100
; given -40, expect -40

(define (f2c f)
  (* 5/9 (- f 32)))

(check-expect (f2c -40) 40)
(check-expect (f2c 32) 0)
(check-expect (f2c 212) 100)