//실행하면 바로 나온다. 볼륨은 ampMul로 정한다.
(
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


//줄씬 음악 off
~pbPlay_1.stop;


~masterEQ.gui.onSelect('normal');

~pbPlay_111 = ~pb111 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat,
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat/2, onebeat/4, onebeat
	]*timeMul*3*0.7, inf),
	\legato, 0.5,
    \freq, Pseq([
        #[180, 240, 300], #[180, 240, 300], #[180, 240, 300], #[180, 200, 240], #[160, 200, 240], #[180, 200, 240],
        #[180, 240, 300], #[180, 240, 300], #[180, 240, 300], #[180, 200, 240], #[160, 200, 240], #[180, 200, 240],
        #[160, 200, 260]
    ]*0.7*0.45, inf), //original = 0.7
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\atTime, Pseq([
        0.3, 0.3, 0.3, 0.4, 0.3, 0.3,
        0.4, 0.3, 0.3, 0.4, 0.6, 0.3, 0.01
    ], inf),
	\susTime, Pseq([
        2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 1
    ], inf),
	\amp, 0.4*ampMul
).play;


~pbPlay_112 = ~pb112 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat,
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat
	]*timeMul*3*0.7, inf),
	\legato, 0.5,
    \freq, Pseq([
        543, 544, 545, 544, 648, 543,
        542, 543, 549, 544, 728, 543,
        543, 544, 545, 544, 648, 543,
        542, 543, 549, 544, 868, 543,
    ]*0.38*0.455, inf), //original 0.38
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\atTime, Pseq([
        0.3, 0.3, 0.3, 0.4, 0.3, 0.3,
        0.4, 0.3, 0.3, 0.4, 0.6, 0.3, 0.01
    ], inf),
	\susTime, Pseq([
        2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 0.3
    ], inf),
	\amp, 0.4*ampMul
).play;



// ~pbPlay_9 = ~pb3_30.play;




if (rec == 1, {
CmdPeriod.doOnce{ s.stopRecording;};
});

)



//노브로 페이드 아웃 한 후에, 공간 흔들기 엠비언트 stop
~pbPlay_112.stop;~pbPlay_111.stop;



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



~pbPlay_12.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat,
		onebeat, onebeat, onebeat, onebeat/2, onebeat, onebeat
	]*timeMul*3*0.7, inf),
	\legato, 0.5,
    \freq, Pseq([
        543, 544, 545, 544, 648, 543,
        542, 543, 549, 544, 728, 543,
        ]*0.38*0.455*(sl.y.linlin(0, 1, 0.9, 1.1)), inf), //original 0.38
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\atTime, Pseq([
        0.3, 0.3, 0.3, 0.4, 0.3, 0.3,
        0.4, 0.3, 0.3, 0.4, 0.6, 0.3, 0.01
    ], inf),
	\susTime, Pseq([
        2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 0.3
    ], inf),
	\amp, 0.4*ampMul
).asStream;


        });
win.front;
)

(
a = Synth(\tak2, [ \susTime, 200, \amp, 30]);

a.free;
)




