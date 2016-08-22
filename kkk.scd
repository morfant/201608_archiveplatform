(//Pattern
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1, ampMul = 100,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0;


if (rec == 1, {
s.prepareForRecord; // you have to call this first
s.record;

SystemClock.sched(
		onebeat*(4*16*2)*timeMul, {|time|
		time.postln;
		"Recording stop.".postln;
		s.stopRecording;
	}
);
});


~masterEQ.gui.onSelect('x_flat');

~pbPlay_1 = ~pb1 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat,
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat/2, onebeat/4, onebeat
	]*timeMul*3, inf),
	\legato, 0.5,
    \freq, Pseq([
        #[180, 240, 300], #[180, 240, 300], #[180, 240, 300], #[180, 200, 240], #[160, 200, 240], #[180, 200, 240],
        #[180, 240, 300], #[180, 240, 300], #[180, 240, 300], #[180, 200, 240], #[160, 200, 240], #[180, 200, 240],#[135, 180, 215]
    ]*0.7, inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\atTime, Pseq([
        0.3, 0.3, 0.3, 0.4, 0.3, 0.3,
        0.4, 0.3, 0.3, 0.4, 0.6, 0.3, 0.01
    ], inf),
	\susTime, Pseq([
        2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 0.3
    ], inf),
	\amp, 0.4*ampMul + 12
).play;


~pbPlay_12 = ~pb12 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat,
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat
	]*timeMul*3, inf),
	\legato, 0.5,
    \freq, Pseq([
        543, 544, 545, 544, 648, 543,
        542, 543, 549, 544, 728, 543,
    ]*0.38, inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\atTime, Pseq([
        0.3, 0.3, 0.3, 0.4, 0.3, 0.3,
        0.4, 0.3, 0.3, 0.4, 0.6, 0.3, 0.01
    ], inf),
	\susTime, Pseq([
        2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 0.3
    ], inf),
	\amp, 0.4*ampMul + 12
).play;

// ~pbPlay_9 = ~pb3_30.play;

if (rec == 1, {
CmdPeriod.doOnce{ s.stopRecording;};
});

)

(//slider 2D : 소리 크기와 속도를 조절하는 2D slider
var onebeat = 2.666666666666/4; // 4 * beat = 1 bar
var win, sli;
var timeMul = 1, ampMul = 100;


win = Window("Slider2D", Rect(100, 100, 600, 600));
sli = Slider2D(win, Rect(20, 20, 500, 500))
        .x_(1) // initial location of x
        .y_(0)   // initial location of y
        .action_({|sl|
            [\sliderX, sl.x, \sliderY, sl.y].postln;



~pbPlay_1.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat, onebeat, onebeat, onebeat
	]*timeMul*sl.x, inf),
	\legato, 0.5,
	\freq, Pseq([ 500, 500]*0.38, inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, 1,
	\amp, 0.4*ampMul + 12
).asStream;


        });
win.front;
)

(
a = Synth(\tak2, [ \susTime, 200, \amp, 30]);

a.free;
)




