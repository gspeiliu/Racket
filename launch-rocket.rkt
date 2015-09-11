;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname launch-rocket) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; there is a bug that the Height must be multiply
; of 3, or it is could not stop, because the stop
; condition is not enough and I don't konw how
; to solve it.


; physical constants
(define HEIGHT 300)
(define WIDTH 100)
(define YDELTA 3)
(define X-POSITION 10)

; graphical constants
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define ROCKET-CENTER (/ (image-height ROCKET) 2))

; LRCD -> Image
; renders the state as a resting or flying rocket
(define (Show x)
  (cond
    [(string? x)  (place-image ROCKET X-POSITION (- HEIGHT ROCKET-CENTER) BACKG)]
    [(<= -3 x -1)  (place-image (text (number->string x) 20 "red")
                  X-POSITION (* 3/4 WIDTH)
                  (place-image ROCKET
                               X-POSITION (- HEIGHT ROCKET-CENTER)
                               BACKG))]
    [(>= x 0)  (place-image ROCKET X-POSITION (- x ROCKET-CENTER) BACKG)]))

; LRCD KeyEvent -> LRCD
; starts the count-down when space bar is pressed
; if the rocket is still resting
(define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))

; LRCD -> LRCD
; raises the rocket by YDELTA
; if it is moving already
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

; stop the animation of the program
(define (stop x)
  (if (and (not (string? x)) (= x 0)) #true #false))

; LRCD -> LRCD
(define (main s)
  (big-bang s
           [to-draw Show]
           [on-key launch]
           [on-tick fly]
           [stop-when stop]))