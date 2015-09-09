;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname big-bang-function) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define (main y)
  (big-bang y
           [on-tick sub1]
           [stop-when zero?]
           [to-draw place-dot-at]
           [on-key stop]))

(define (place-dot-at y)
  (place-image (circle 3 "solid" "red") 50 y (empty-scene 100 100)))

(define (stop y ke)
  0)

(define (string-first str)
  (string-ith str 0))

(define (string-last str)
  (string-ith str (- (string-length str) 1)))

(define (string-rest str)
  (substring str 1 (string-length str)))

(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))