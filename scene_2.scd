//----------------Scene 2: 고무줄 & 파리잡기----------------

//Control setup done?
(
var oscResps = Array.newClear(8);

var bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000, timeMul = 1, ampMul = 5,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0,
dval = 1, susval = 1.0, ampval = 1.0,
changeStreamValue = nil,
changeSustainTime = nil,
changeAmp = nil;

w = Window.new("Scene_2", Rect(0, 800, 90, 90));
b = Button(w, Rect(20, 20, 50, 50))
        .states_([
            ["Go", Color.cyan, Color.grey]
        ])
        .action_({ arg butt;

	dval = 0.32;
	("DVAL RESET " + dval).postln;
	changeStreamValue.value(dval);

	n.sendMsg("/1/fader1", dval);
	butt.value.postln;

        });
w.front;


//--CHANGE STREAM VALUE--
changeStreamValue = {|arg_dval|
~pb1.stream = Pbind(
		\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat/3, onebeat/3, onebeat/3, onebeat, onebeat, onebeat, onebeat, onebeat, onebeat,

	]*timeMul, inf),
		\legato, 0.5,
		\freq, Pseq([100, 500, 300, 200] * arg_dval, inf),
		\susTime, 8.0,
		\amp, 0.4*ampMul + 30
).asStream;
};


//--CHANGE SUSTAIN TIME--
changeSustainTime = {|arg_sus|
~pb1.stream = Pbind(
		\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat/3, onebeat/3, onebeat/3, onebeat, onebeat, onebeat, onebeat, onebeat, onebeat,

	]*timeMul, inf),
		\legato, 0.5,
		\freq, Pseq([100, 500, 300, 200] * dval, inf),
		\susTime, arg_sus,
		\amp, 0.4*ampMul + 20
).asStream;
};


//--CHANGE AMP--
changeAmp = {|arg_amp|
~pb1.stream = Pbind(
		\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat/3, onebeat/3, onebeat/3, onebeat, onebeat, onebeat, onebeat, onebeat, onebeat,

	]*timeMul, inf),
		\legato, 0.5,
		\freq, Pseq([100, 500, 300, 200] * dval, inf),
		\susTime, susval,
		\amp, (0.4*ampMul + 20) * arg_amp
).asStream;
};

//--OSCFUNC--

9.do({|i| oscResps[i].free;});

oscResps[0] = OSCFunc({|msg, time, addr, recvPort|
	msg.postln;
	dval = msg[1].linlin(0.0, 1.0, 0.001, 0.6);
	changeStreamValue.value(dval);
}, '/1/fader1');

oscResps[1] = OSCFunc({|msg, time, addr, recvPort|
	msg.postln;
	susval = msg[1];
	changeSustainTime.value(susval);
}, '/1/fader2');

oscResps[4] = OSCFunc({|msg, time, addr, recvPort|
	msg.postln;
	ampval = msg[1].linexp(0.00, 1.0, 0.1, 7.0);
	changeAmp.value(ampval);
}, '/1/fader5');


//--TOGGLE--
oscResps[5] = OSCFunc({|msg, time, addr, recvPort|
	dval = 0.32;
	("DVAL RESET " + dval).postln;
	changeStreamValue.value(dval);

	// m = NetAddr("192.168.1.3", 9000);
	// m = NetAddr("169.254.110.195", 9000);	//giy air
	// m = NetAddr("172.30.1.4", 9000);	//giy air
	n.sendMsg("/1/fader1", dval);



}, '/1/toggle1');
)


//----------------Play sound--------------------
//volume 0에서 조금 빠른 페이드 인으로.
//무용수의 앞뒤 거리에 따라 음색, 음고 조정


(//Pattern
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1, ampMul = 200,
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


~pbPlay_1 = ~pb1 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat/3, onebeat/3, onebeat/3, onebeat, onebeat, onebeat, onebeat, onebeat, onebeat
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([100, 500, 300, 200]/4, inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, 0.01,
	\amp, 0.4*ampMul + 20
).play;


if (rec == 1, {
CmdPeriod.doOnce{ s.stopRecording;};
});

)




//줄 씬 음악 OFF
~pbPlay_1.stop;

