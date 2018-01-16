Best only go as far as 14-15 cycles.
Everything else takes too long.


dependencies:

PlotDragonCurve (plotting 1)
which uses DragonCurve (generating 1)
(generating as subfunction of plotting)

or
DragonCurves (generating multiple)
which uses PlotDragonCurve2 (plotting 1)
(plotting as subfunction of generating)
try:
DragonCurves (15, true)


NextDragonCurve
takes a curve as input and returns the next one

DragonCurve_no_return
generates a curve (number of cycles as input) and displays it in the command window