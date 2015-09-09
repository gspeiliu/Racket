;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname batch) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define (f2c f)
  (* (/ 5 9) (- f 32)))

(define (convert in out)
  (write-file out
             (string-append
              (number->string
               (f2c
                (string->number
                 (read-file in))))
              "\n")))

(define (number->square s)
  (square s "solid" "red"))

(define (reset s ke)
  100)

(big-bang 100
         [to-draw number->square]
         [on-tick sub1]
         [stop-when zero?]
         [on-key reset])

