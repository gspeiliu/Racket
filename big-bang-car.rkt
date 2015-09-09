;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname big-bang-car) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define HEIGHT-OF-WORLD (* WHEEL-RADIUS 6))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define CAR-WIDTH (* WHEEL-RADIUS 8))
(define CAR-HEIGHT (* WHEEL-RADIUS 3))
(define MAIN-CAR (rectangle CAR-WIDTH CAR-HEIGHT "solid" "red"))

(define TOP-CAR-WIDTH (* WHEEL-RADIUS 4))
(define TOP-CAR-HEIGHT (* WHEEL-RADIUS 1))
(define TOP-CAR (rectangle TOP-CAR-WIDTH TOP-CAR-HEIGHT "solid" "red"))
(define CAR-NOWHEEL (above TOP-CAR MAIN-CAR))
;this WHITE is the place holder behind CAR-NOWHEEL
(define WHITE (rectangle 5 WHEEL-RADIUS "solid" "white"))


(define WHEEL (circle WHEEL-RADIUS "solid" "blue"))
(define SPACE (rectangle WHEEL-RADIUS WHEEL-RADIUS 'solid "WHITE"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
;the literal number of 5 2.5 12.5 3.75 all is the center coordinate for place the image
(define COMPLETE (place-image (rectangle WHEEL-RADIUS (/ WHEEL-RADIUS 2) "solid" "red") 
                             (+ (* WHEEL-RADIUS 2) (/ WHEEL-RADIUS 2)) (/ (* WHEEL-RADIUS 3) 4) BOTH-WHEELS))
;the literal number 20 is the center coordinate of the image (above CAR-NOWHEEL WHITE)
(define CAR-CENTERX (/ CAR-WIDTH 2))
(define CAR-CENTERY (+ CAR-HEIGHT TOP-CAR-HEIGHT))
(define CAR (place-image COMPLETE CAR-CENTERX CAR-CENTERY (above CAR-NOWHEEL WHITE)))

(define BACKGROUND (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

(define Y-CAR (/ (* WHEEL-RADIUS 7) 2))

; worldState -> WorldState
; move the car by three pixels every time the clock ticks
; example: 20, expect 23
; example: 78 ,expect 81
(define (tock ws)
  (+ ws 3))

; WorldState -> Image
; places the car into a scene according to the given world state
(define (render ws)
  (place-image CAR (+ ws 20) Y-CAR BACKGROUND))

; the condition of stop execute
(define (stop ws)
  (if (> ws 160) #true #false))

; key stroke
(define (ke-h ws str)
  160)
; the definition of a new shape tree
(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

; WorldState Number Number String -> WorldState
; places the car at the x-coordinate if me is "button-down"
; given: 21 10 20 "center"
; wanted: 21
; given: 42 10 20 "button-down"
; wanted: 10
; given: 42 10 20 "move"
; wanted: 42
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

; big-bang interactive function
(define (main ws)
  (big-bang ws
           [on-tick tock]
           [stop-when stop]
           [to-draw render]
           [on-key ke-h]
           [on-mouse hyper]))