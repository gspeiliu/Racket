;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname trafficlight-simulation) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; A TrafficLight shows one of three colors:
; – "red"
; – "green"
; – "yellow"
; interpretation each element of TrafficLight represents which colored
; bulb is currently turned on

; physical constants
(define RADIUS 10)
(define INTERVAL 6)

; TrafficLight -> TrafficLight
; determines the next state of the traffic light, given current-state
(define (tl-next current-state) 
  (cond
    [(string=? "red" current-state) "green"]
    [(string=? "green" current-state) "yellow"]
    [(string=? "yellow" current-state) "red"]))

; auxiliary function for creating the image of three bulbs and empty-scene
(define (draw current-state)
  (overlay (
                                            cond
                                             [(string=? "red" current-state) (beside (circle RADIUS "solid" "red")
                                                                                                          (circle INTERVAL "solid" "white")
                                                                                                          (circle RADIUS "outline" "yellow")
                                                                                                          (circle INTERVAL "solid" "white")
                                                                                                          (circle RADIUS "outline" "green"))]
                                             [(string=? "yellow" current-state) (beside (circle RADIUS "outline" "red")
                                                                                                          (circle INTERVAL "solid" "white")
                                                                                                          (circle RADIUS "solid" "yellow")
                                                                                                          (circle INTERVAL "solid" "white")
                                                                                                          (circle RADIUS "outline" "green"))]
                                             [(string=? "green" current-state) (beside (circle RADIUS "outline" "red")
                                                                                                          (circle INTERVAL "solid" "white")
                                                                                                          (circle RADIUS "outline" "yellow")
                                                                                                          (circle INTERVAL "solid" "white")
                                                                                                          (circle RADIUS "solid" "green"))]) (empty-scene 100 30)))


; TrafficLight -> Image
; renders the current state of the traffic light as an image
(define (tl-render current-state) 
  (draw current-state))

; TrafficLight -> TrafficLight
; simulates a traffic light that changes with each clock tick
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))