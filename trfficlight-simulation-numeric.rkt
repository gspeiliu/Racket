;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname trfficlight-simulation-numeric) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; A N-TrafficLight shows one of three colors:
; - 0
; - 1
; - 2
; interpretaion 0 means the traffic light shows red,
; 1 green, and 2 yellow


; N-TrafficLight -> N-TrafficLight
; determines the next state of the traffic light, given current-state
(define (tl-next-numeric current-state)
  (modulo (+ current-state 1) 3))

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; A S-TrafficLight shows one of three colors:
; - RED
; - GREEN
; - YELLOW

; S-TrafficLight -> S-TrafficLight
; determines the next state of the traffic light, given cs

(define (tl-next-symbolic cs)
  (modulo (+ cs 1) 3))

(define (tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))