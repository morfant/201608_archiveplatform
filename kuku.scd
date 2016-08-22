(
//kuku
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1/3, ampMul = 5,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0;


~pb3_22 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3

		]*timeMul, inf),
	\legato, 0.1,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.35, 0.44, 0.6, 0.25, 0.2, 0.72]+0.2, 1)
		], inf),
	\envdur, 	0.01,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1], inf),
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);


~pb3_23 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3

		]*timeMul, inf),
	\legato, 0.1,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.25, 0.2, 0.25,0.2,0.3, 0.2]+0.2, 1)
		], inf),
	\envdur, 	0.01,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1]/2, inf),
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);


~pb3_24 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*2

		]*timeMul/8, inf),
	\legato, 0.05,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
        // Pseq([0.5, 0.5, 0.5,0.5,0.5,0.6,0.5,0.3]+0.2, 1)
		Pseq([0.5, 0.5, 0.5,0.5,0.5,0.5,0.5,0.5, 0.5, 0.5, 0.5,0.4,0.5,0.5,0.5,0.5, 0.5, 0.5, 0.5,0.5,0.5,0.5,0.5,0.3]-0.1, 1)
		], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		Pseq([0.01, 0.01, 0.01, 0.1, 0.1, 0.1], inf),
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.3*ampMul * 4
);

~pb3_25 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*4, onebeat*12

		]*timeMul, inf),
	\legato, 0.05,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.8, 0.75]+0.15, 1)
		], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		0.2,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);


~pb3_26 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
        onebeat*3,		onebeat*3, 		onebeat*3,       onebeat*3,

		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
        onebeat*3,		onebeat*3, 		onebeat*3*2

		]*timeMul*3/2, inf),
	\legato, 0.05,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([
            0.5, 1, 0.9, 0.88, 0.8, 0.7, 0.88, 0.78, 0.68, 0.65, 0.68, 0.78, 0.5, 0.58, 0.5, 0.47,
            0.5, 1, 0.9, 0.88, 0.8, 0.7, 0.88, 0.78, 0.68, 0.65, 0.68, 0.78, 0.5, 0.58, 0.5
        ]+0.006, 1)
		], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		0.01,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);

~pb3_27 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*4.5,		onebeat*1,  onebeat*5.5, onebeat*1,
        onebeat*4.5,		onebeat*1,  onebeat*6.5

		]*timeMul*3/2, inf),
	\legato, 0.05,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([
            0.5, 1, 1, 0.5,
            0.48, 0.9, 0.9
        ], 1)
		], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		0.01,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);


~pb3_28 = Pbind(
 	\instrument,        \tak,
    \susTime, 0.2,
 	\dur,    Pseq([
		onebeat*3*4, 		onebeat*3*4, 		onebeat*3*4, 		onebeat*1.5, 		onebeat*3*4,
		onebeat*3*4, 		onebeat*3*4, 		onebeat*3*4, 		onebeat*3*8
		]*timeMul*3/2, inf),
	\freq,
		Pseq([
            44.midicps, 37.midicps, 39.midicps, 41.midicps, 42.midicps,
            44.midicps, 37.midicps, 39.midicps, 37.midicps
		]*4, inf),
	\amp, 15*4
);


~pb3_29 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
        onebeat*3,		onebeat*3, 		onebeat*3,       onebeat*3,

		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
        onebeat*3,		onebeat*3, 		onebeat*3*2

		]*timeMul*3/2, inf),
	\legato, 0.05,
    \freq, 0.2,
    // \freq, Pseq([
    //     Pseq([
    //         0.5, 1, 0.9, 0.88, 0.8, 0.7, 0.88, 0.78, 0.68, 0.65, 0.68, 0.78, 0.5, 0.58, 0.5, 0.47,
    //         0.5, 1, 0.9, 0.88, 0.8, 0.7, 0.88, 0.78, 0.68, 0.65, 0.68, 0.78, 0.5, 0.58, 0.5
    //     ]+0.006, 1)
    // ], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		0.01,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);


~pb3_30 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*1,		onebeat*1,  onebeat*1,
        onebeat*1,		onebeat*1,  onebeat*1, onebeat*1,
        onebeat*1,		onebeat*1,  onebeat*1,
        onebeat*1,		onebeat*1,  onebeat*1, onebeat*1

		]*timeMul*3/2, inf),
	\legato, 0.05,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([
            0.5, 1, 1,
            0.5, 0.48, 0.9, 0.9,
            0.5, 1, 1,
            0.5,1,0.9,1
        ]/2, 1)
		], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		0.05,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*ampMul * 4
);


~pb3_31 = Pbind(
 	\instrument,        \hat2,
 	\dur,    Pseq([
		onebeat*4,		onebeat*1,  onebeat*1, onebeat*1,
		onebeat*4,		onebeat*2,  onebeat*1
		]*timeMul*3/2, inf),
	\legato, 0.01,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([
            900, 980, 900, 800,
            900, 1080, 800,
            900, 980, 900, 800,
            900, 700, 800
        ]/2/2, 1)
		], inf),
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		Pseq([1, 0.2, 0.2, 0.3]/2/2/2/8, inf),
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.8*ampMul
);

)



~pbPlay_2 = ~pb3_22.play;//어디?
~pbPlay_3 = ~pb3_23.play;
~pbPlay_4 = ~pb3_24.play;
~pbPlay_4 = ~pb3_24.play;~pbPlay_6 = ~pb3_25.play;
~pbPlay_6 = ~pb3_25.play;


//공간 흔들기
~pbPlay_9 = ~pb3_30.play;
~pbPlay_10 = ~pb3_31.play;

~pbPlay_10 = ~pb3_31.play;
~pbPlay_9.stop;

~pbPlay_10 = ~pb3_31.play;

//----------------kuku-------------------- 파리잡기
~masterEQ.gui.onSelect('ending');~pbPlay_8 = ~pb3_27.play; //melody - sub : 박수치면서 뛰는씬에서 틀고, 박수로 바뀔때 끈다.
~pbPlay_8.stop;


//----------------관객들유도-------------------- : 페이드인
~masterEQ.gui.onSelect('ending');~pbPlay_7 = ~pb3_26.play; //melody :적극적으로 움직이기 시작할 때 페이드 인, 아래에 깔리는 정도의 음량으로(노브 10시정도)! /  조금씩 빨라진다, 조금식 커진다 (조절 가능하게)
~pbPlay_7.stop;


(//slider 2D : 소리 크기와 속도를 조절하는 2D slider
var onebeat = 2.666666666666/4; // 4 * beat = 1 bar

w = Window("Slider2D", Rect(100, 100, 600, 600));
t = Slider2D(w, Rect(20, 20, 500, 500))
        .x_(1) // initial location of x
        .y_(0)   // initial location of y
        .action_({|sl|
            [\sliderX, sl.x, \sliderY, sl.y].postln;



~pbPlay_7.stream = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
        onebeat*3,		onebeat*3, 		onebeat*3,       onebeat*3,

		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
		onebeat*3,		onebeat*3, 		onebeat*3, 		onebeat*3,
        onebeat*3,		onebeat*3, 		onebeat*3*2

		]*sl.x/3*3/2, inf),
	\legato, 0.05,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([
            0.5, 1, 0.9, 0.88, 0.8, 0.7, 0.88, 0.78, 0.68, 0.65, 0.68, 0.78, 0.5, 0.58, 0.5, 0.47,
            0.5, 1, 0.9, 0.88, 0.8, 0.7, 0.88, 0.78, 0.68, 0.65, 0.68, 0.78, 0.5, 0.58, 0.5
        ]+0.006, 1)
		], inf),
	\envdur, 	0.001,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.4]/10, inf),
    \susTime, 		0.01,
    // Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3], 1),
	\amp, 0.6*5 * 4
).asStream;


        });
w.front;

// ~pbPlay_7 = ~pb3_26.play; //melody :적극적으로 움직이기 시작할 때 페이드 인, 아래에 깔리는 정도의 음량으로(노브 10시정도)! /  조금씩 빨라진
)




//무용수가 객석으로부터 가장 멀리 떨어진 후, 동작을 끝내면 전환음악 튼다.
//줄 솔로에서 나던 소리도 끄지 않고 튼다.

//먼저,

~pbPlay_2 = ~pb3_2.play;
~pbPlay_2.stop;

원래 줄 씬 음악 끈다.
~pbPlay_1.stop;

~pbPlay_4 = ~pb3_4.play; //3박자
~pbPlay_4.stop;

