국립현대무용단
믹서 페이더 0, 인터페이스 12시

//!!!osc 셋팅 잊지 말자!!!//

//---------------------------- 0 ----------------------------
touch osc 의 설정에서 host 주소를 노트북의 ip 주소로 바꾼다.
touch osc 에서 local ip addr이 아래와 같은지 확인후, (다르면 수정) 실행한다.

n = NetAddr("169.254.165.170", 9000);	//Check IP addr of ipad/iphone. - giy air
// n = NetAddr("192.168.1.100", 9000);	//IP addr ipad/iphone - egg046
// n = NetAddr("192.168.0.137", 9000);	//IP addr ipad/iphone - 국립현대 연습실



~masterEQ = ChannelEQ.new(2, s, 0, 0);




//---------------------------- 1 ----------------------------


(
~bolero = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/bolero.wav");
// ~bolero.play;

~ment = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/ment.wav");
// ~ment.play;

~na = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/na.wav");
// ~na.play;

~niga = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/niga.wav");
// ~niga.play;

// ~love = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/love.wav");
// ~love.play;

// ~karmen = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/karmen.wav");
// ~karmen.play;

)


//---------------------------- 2 ----------------------------
(
SynthDef(\mentbr,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~ment, BufRateScale.kr(~ment)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~ment.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\na,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~na, BufRateScale.kr(~na)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\niga,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~niga, BufRateScale.kr(~niga)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~niga.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\bolero,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~bolero, BufRateScale.kr(~bolero)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~bolero.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

/*SynthDef(\love,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 1 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~love, BufRateScale.kr(~love)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~love.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\karmen,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 1 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~karmen, BufRateScale.kr(~karmen)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~karmen.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;*/


//Synth 1
SynthDef(\bass, {| out = 0, amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1,
	freqs = #[220, 440, 880, 1760],
    amps=#[0.1, 0.23, 0.12, 0.05],
    phases=#[1, 1.5, 2, 2.5]|
	var env, sig, lowcut_sig;
	env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
	sig = DynKlang.ar(`[freqs, amps, phases]);
	sig = RLPF.ar(sig, lf, rq);
	lowcut_sig = HPF.ar(sig, 100);
	// Out.ar(0, Pan2.ar(sig * env, 0, amp));
	Out.ar(out, Pan2.ar(lowcut_sig * env, 0, amp));
}).add;

//Synth 2
SynthDef(\hat, {| out = 0, freq = 6000, amp = 0.6, amp2 = 0.9, filfreq = 1700, rq = 0.2, gate = 1, pan = 0 |
	var sig, env, sig2, lowcut_sig, lowcut_sig2;
	sig = LFPar.ar(freq);
	sig = RHPF.ar(sig, filfreq, rq, sig*0.1);
	sig2 = Impulse.ar(0, mul: amp2);
	lowcut_sig = HPF.ar(sig, 100);
	lowcut_sig2 = HPF.ar(sig2, 100);
	env = EnvGen.kr(Env.perc(0.05, 0.2), gate, doneAction: 2);
	// Out.ar(0, Pan2.ar(sig2 + sig * env, pan, amp));
	Out.ar(out, Pan2.ar(lowcut_sig2 + lowcut_sig * env, pan, amp));
}).add;

//Synth 2
SynthDef(\hat2, {| out = 0, freq = 6000, amp = 0.6, amp2 = 0.9, filfreq = 1700, rq = 0.2, gate = 1, pan = 0, susTime = 1 |
	var sig, env, sig2, lowcut_sig, lowcut_sig2;
	sig = LFPar.ar(freq);
	sig = RHPF.ar(sig, filfreq, rq, sig*0.1);
	sig2 = Impulse.ar(0, mul: amp2);
	lowcut_sig = HPF.ar(sig, 100);
	lowcut_sig2 = HPF.ar(sig2, 100);
    env = EnvGen.kr(Env.linen(0.01, susTime), gate, doneAction: 2);
	// Out.ar(0, Pan2.ar(sig2 + sig * env, pan, amp));
	Out.ar(out, Pan2.ar(lowcut_sig2 + lowcut_sig * env, pan, amp));
}).add;

//Synth 3
SynthDef(\tak, {| out = 0, freq = 300, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 3200, rq = 0.1, gate = 1,
	atTime = 0.1, susTime = 2.0, relTime = 0.1, pan = 0 |

	var sig, env, sig2, del, mod, lowcut_sig;
	mod = LFSaw.kr(1/10, add: 1);
	sig = LFCub.ar(freq, mod);
	sig2 = Impulse.ar(0, mul: amp2);
	sig = BPF.ar((sig+sig2), filfreq, rq, sig*0.3);
	sig = DelayN.ar(sig, 0.4, 0.1, add: sig*0.3);
	lowcut_sig = HPF.ar(sig, 100);
	env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	// Out.ar(0, Pan2.ar((sig) * env, pan, amp));
	Out.ar(out, Pan2.ar((lowcut_sig) * env, pan, amp));
}).add;

SynthDef(\tak2, {| out = 0, freq = 300, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 3200, rq = 0.1, gate = 1,
	atTime = 0.1, susTime = 2.0, relTime = 0.1, pan = 0 |

	var sig, env, sig2, del, mod, lowcut_sig;
	mod = LFSaw.kr(1/10, add: 1);
    sig = LFCub.ar(MouseY.kr(280, 820).poll*0.38, mod);
	sig2 = Impulse.ar(0, mul: amp2);
	sig = BPF.ar((sig+sig2), filfreq, rq, sig*0.3);
	sig = DelayN.ar(sig, 0.4, 0.1, add: sig*0.3);
	lowcut_sig = HPF.ar(sig, 100);
    env = EnvGen.kr(Env.linen(atTime, susTime, relTime, curve: 6), gate, doneAction: 2);
	// Out.ar(0, Pan2.ar((sig) * env, pan, amp));
	Out.ar(out, Pan2.ar((lowcut_sig) * env, pan, amp));
}).add;



//Synth 4
SynthDef(\dd, {| out = 0, freq = 1, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0 |
	var sig, env, sig2, del, mod, lowcut_sig, lowcut_sig2;
	sig = Blip.ar(freq);
	sig = LPF.ar(sig, filfreq);

	sig2 = Impulse.ar(0, mul: amp2);
	env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, 100);
	lowcut_sig2 = HPF.ar(sig2, 100);

    // Out.ar(0, Pan2.ar((sig + sig2) * env, pan, amp));
    Out.ar(out, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;

//Synth 5
SynthDef(\dds, {| out = 0, freq = 1, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7|
	var sig, env, sig2, del, mod, lowcut_sig, lowcut_sig2;
	sig = Blip.ar(freq);
	sig = LPF.ar(sig, filfreq);

	// sig2 = Impulse.ar(0, mul: amp2);
    // sig2 = LFNoise0.ar(nf);
    sig2 = LFNoise0.kr(nf);
	env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, 100);
    lowcut_sig2 = LPF.ar(HPF.ar(sig2, 100), 500, 0.7);

    Out.ar(out, Pan2.ar(HPF.ar((sig + sig2), 100) * env, pan, amp));
    // Out.ar(0, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;

// //Synth 7 - 숨쉬기
// SynthDef(\bass2, {| amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1,
//     freqs = #[220, 440, 880, 1760],
//     amps=#[0.1, 0.23, 0.12, 0.05],
//     phases=#[1, 1.5, 2, 2.5]|
//     var env, sig, lowcut_sig;
//     env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
//     sig = DynKlang.ar(`[freqs, amps, phases]);
//     sig = RLPF.ar(sig, lf, rq);
//     lowcut_sig = HPF.ar(sig, 100);
//     // Out.ar(0, Pan2.ar(sig * env, 0, amp));
//     Out.ar(0, Pan2.ar(lowcut_sig * env, 0, amp));
// }).add;
//
//
// //Synth 8 - 숨쉬기2
// SynthDef(\bass3, {| amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1, nf = 20,
//     freqs = #[1280, 1760, 3000, 4200],
//     amps=#[0.1, 0.23, 0.12, 0.05],
//     phases=#[1, 1.5, 2, 2.5]|
//     var env, sig, lowcut_sig, sig2;
//     env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
//     sig = DynKlang.ar(`[freqs, amps, phases]);
//     sig = RLPF.ar(sig, lf, rq);
//     sig2 = LFNoise0.kr(nf);
//     lowcut_sig = HPF.ar(sig, 100);
//     // Out.ar(0, Pan2.ar(sig * env, 0, amp));
//     Out.ar(0, Pan2.ar(lowcut_sig * env * sig2, 0, amp));
// }).add;
//
//
// //Synth 9 - 숨쉬기3
// SynthDef(\bass4, {| amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1, nf = 20,
//     freqs = #[1280, 760, 2000, 3200],
//     amps=#[0.1, 0.23, 0.12, 0.05],
//     phases=#[1, 1.5, 2, 2.5]|
//     var env, sig, lowcut_sig, sig2;
//     env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
//     sig = DynKlang.ar(`[freqs, amps, phases]);
//     sig = RLPF.ar(sig, lf, rq);
//     sig2 = LFNoise0.kr(nf);
//     lowcut_sig = HPF.ar(sig, 100);
//     // Out.ar(0, Pan2.ar(sig * env, 0, amp));
//     Out.ar(0, Pan2.ar(lowcut_sig * env * sig2, 0, amp));
// }).add;


//stool
SynthDef(\ten, {| freq = 500, modfreq = 5, amp = 0.4, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1, nff = 2.5,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7|
	var sig, env, sig2, del, mod, lowcut_sig, lowcut_sig2, gateSig;
	// sig = LFSaw.ar(freq);
	sig = LFNoise0.ar(freq);
	sig = LPF.ar(sig, filfreq);

	// sig2 = Impulse.ar(0, mul: amp2);
	sig2 = LFNoise0.kr(nf);
	// env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	gateSig = LFNoise0.kr(nff);
	env = EnvGen.kr(Env.linen(sustainTime: LFNoise0.kr(2).range(0.01, 0.5), releaseTime: 0.05, curve: 9), gateSig, doneAction: 2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, 100);
	lowcut_sig2 = HPF.ar(sig2, 100);

	Out.ar(0, Pan2.ar((sig + sig2) * env, pan, amp));
	// Out.ar(0, Pan2.ar((sig + lowcut_sig2) * env, pan, amp));
}).add;

)




//---------------------------- 3 ----------------------------
/*(
//Synth - mic in
SynthDef(\micIn, {| amp = 1, gate = 1 |
var sig;
sig = SoundIn.ar(0);
Out.ar(0, Pan2.ar(sig, 0, amp));
}).add;


//Synth - buffer read
SynthDef(\br,
{
		| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 1 |
		var sig1, sig2, sig3, sig4, sig5, env;
 		sig1 = PlayBuf.ar(1, ~buf, BufRateScale.kr(~buf)*rate, startPos: 0, loop: loop, doneAction: 2);
 		sig2 = PlayBuf.ar(1, ~buf, BufRateScale.kr(~buf)*rate, startPos: s.sampleRate * 2, loop: loop, doneAction: 2);
 		sig3 = PlayBuf.ar(1, ~buf, BufRateScale.kr(~buf)*rate, startPos: s.sampleRate * 10, loop: loop, doneAction: 2);
 		sig4 = PlayBuf.ar(1, ~buf, BufRateScale.kr(~buf)*rate, startPos: s.sampleRate * 100, loop: loop, doneAction: 2);
		sig5 = PlayBuf.ar(1, ~buf, BufRateScale.kr(~buf)*rate, startPos: s.sampleRate * 50, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~buf.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
		//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
		Out.ar(0, Pan2.ar((sig1 + sig2 + sig3 + sig4 + sig5) * env, pan, amp));
}).add;
)*/


//---------------------------- 4 ----------------------------
(
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1/3, ampMul = 5,
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



~pb2_1 = Pbind(
	\instrument,        \hat,
	\dur,    Pseq([onebeat*2/7, onebeat*3*4]*timeMul, 1),
	\freq, Pseq([500, 700]*8, inf),
	\amp, 0.4*ampMul
);

~pb2_2 = Pbind(
	\instrument,        \hat,
	\dur,    Pseq([onebeat*1/7, onebeat*2/7]*timeMul, 1),
	\freq, Pseq([500, 700, 660, 500]/4, inf),
	\amp, Pseq([0.4*ampMul + 10, 0.4*ampMul + 10, 0.4*ampMul + 10, 0.4*ampMul + 10], inf)
);

~pb2_3 = Pbind(
	\instrument,        \hat,
	\dur,    Pseq([onebeat*1/7, onebeat*2/7, onebeat*1/7, onebeat*4/7]*timeMul, 1),
	\freq, Pseq([500, 700, 660]/4, inf),
	\amp, Pseq([0.4*ampMul + 10, 0.4*ampMul + 10, 0.4*ampMul + 10, 0.4*ampMul + 10], inf)
);


~o1.free;~o2.free;~o3.free;
~o1 = OSCFunc({|msg, time, addr, recvPort|
	if (msg[1] == 1, {
		~pb2_2.play;
	});
}, '/2/push1', n);


~o2 = OSCFunc({|msg, time, addr, recvPort|
	if (msg[1] == 1, {
		~pb2_1.play;
	});
}, '/2/push2', n);


~o3 = OSCFunc({|msg, time, addr, recvPort|
	if (msg[1] == 1, {
		~pb2_3.play;
	});
}, '/2/push3', n);



if (rec == 1, {
CmdPeriod.doOnce{ s.stopRecording;};
});

)





//---------------------------- 5 ----------------------------
(
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1/4, ampMul = 10,
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

/*Pbind(
	\instrument, \br,
	\dur, Pseq([onebeat*4*16], inf),
	\amp, 0.3
).play;*/


~pb3_1 = Pbind(
	\instrument,        \dd,
	\dur,    Pseq([
		onebeat

	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		Pseq([0.9, 1.24], 3),
		Pseq([0.25, 0.24, 0.2], 1)
	], inf),
	\envdur, 0.1,
	\susTime, 0.01,
	\amp, 0.4*ampMul
);



//3씬 시작과 동시에?
~pb3_2 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3

		]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.25, 0.24, 0.2], 1)
		], inf),
	\envdur, 0.1,
	\susTime, 0.01,
	\amp, 0.6*ampMul * 4
);


//kuku
~pb3_22 = Pbind(
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*3

		]*timeMul, inf),
	\legato, 0.1,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.25, 0.24, 0.2, 0.25, 0.2, 0.5], 1)
		], inf),
	\envdur, 0.01,
	\susTime, 0.1,
	\amp, 0.6*ampMul * 4
);


~pb3_3 = Pbind(
	\instrument,        \dd,
	\dur,    Pseq([
		onebeat, onebeat*4,
		onebeat, onebeat*2, onebeat*6,
		onebeat, onebeat, onebeat*2, onebeat/4,

		onebeat, onebeat*4,
		onebeat, onebeat*2, onebeat*6,
		onebeat, onebeat, onebeat, onebeat,

		onebeat, onebeat*4,
		onebeat, onebeat*2, onebeat*6,
		onebeat, onebeat*4,
		onebeat, onebeat*2, onebeat*6,

		onebeat, onebeat*4,
		onebeat, onebeat*2, onebeat*6,
		onebeat, onebeat, onebeat*2

	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		Pseq([0.2, 1.24], 1),
		Pseq([1.05, 0.24, 1.2], 1),
		Pseq([1.05, 1.05, 1.02, 1.04], 1),

		Pseq([0.2, 1.24], 1),
		Pseq([1.05, 0.24, 1.2], 1),
		Pseq([1.05, 1.05, 1.02, 1.04], 1),

		Pseq([0.2, 1.24], 1),
		Pseq([1.05, 0.24, 1.2], 1),
		Pseq([0.2, 1.24], 1),
		Pseq([1.05, 0.24, 1.2], 1),

		Pseq([0.2, 1.24], 1),
		Pseq([1.05, 0.24, 1.2], 1),
		Pseq([1.05, 1.05, 1.02], 1)

	], inf),
	\envdur, 0.1,
	\susTime, 0.01,
	\amp, 0.4*ampMul
);


~pb3_4 = Pbind( //베이스
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*4

		]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.25, 0.24, 0.2], 1)
		], inf),
	\envdur, 0.1,
	\susTime, 0.01,
	\amp, 0.3*ampMul * 5
);

~pb3_5 = Pbind( //미들
 	\instrument,        \dd,
 	\dur,    Pseq([
		onebeat*8

		]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		// Pseq([0.9, 1.4, 0.9, 0.7], 1),
		Pseq([0.25, 0.24, 0.2]*2, 1)
		], inf),
	\envdur, 0.1,
	\susTime, 0.01,
	\amp, 0.3*ampMul * 7
);

~os1.free;~os2.free;~os3.free;
~os1 = OSCFunc({|msg, time, addr, recvPort|
	if (msg[1] == 1, {
		~pbPlay_1 = ~pb3_1.play;
	},{
		~pbPlay_1.stop;
	});
}, '/3/toggle1', n);


~os2 = OSCFunc({|msg, time, addr, recvPort|
	if (msg[1] == 1, {
		~pbPlay_2 = ~pb3_2.play;
	},{
		~pbPlay_2.stop;
	});
}, '/3/toggle2', n);


~os3 = OSCFunc({|msg, time, addr, recvPort|
	if (msg[1] == 1, {
		~pbPlay_3 = ~pb3_3.play;
	},{
		~pbPlay_3.stop;
	});
}, '/3/toggle3', n);


if (rec == 1, {
CmdPeriod.doOnce{ s.stopRecording;
	~os1.free;~os2.free;~os3.free;};
});

)

//줄씬 button
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



(
var oscResps = Array.newClear(8);
var ampVal = Array.newClear(3);

var bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000, timeMul = 1, ampMul = 5, sustain = 0.5,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0,
susVal = 1.0, tempoVal =  2.666666666666/4,
changeSustainValue = nil, changeTempoValue = nil,
changeAmpValue_0 = nil,
changeAmpValue_1 = nil,
changeAmpValue_2 = nil;

~pm4Syn = Array.newClear(20);


//--CHANGE SUSTAIN VALUE--
changeSustainValue = {|arg_val|
	sustain = arg_val;

~pm1.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
	// \freq, Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], inf),
	// \freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, sustain,
		\amp, ampVal[0]
).asStream;

/*
~pm2.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
	]*sustain, inf),
	\amp, 70
).asStream;


~pm3.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps,
		36.midicps, 40.midicps, 36.midicps, 35.midicps, 35.midicps
	], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
	]*sustain, inf),
	\amp, 70
).asStream;*/

};


//--CHANGE TEMPO VALUE--
changeTempoValue = {|arg_val|
	timeMul = arg_val;

~pm1.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
	// \freq, Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], inf),
	// \freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, sustain,

		\amp, ampVal[0]
).asStream;

/*
~pm2.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
	]*sustain, inf),
	\amp, 70
).asStream;


~pm3.stream = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps,
		36.midicps, 40.midicps, 36.midicps, 35.midicps, 35.midicps
	], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
	]*timeMul, inf),
	\amp, 70
).asStream;
*/

};


//--CHANGE AMP VALUE--
changeAmpValue_0 = {|arg_val|
	ampVal[0] = arg_val;
	~pm1.stream = Pbind(
		\instrument,        \tak,
		\dur,    Pseq([
			onebeat
		]*timeMul, inf),
		\legato, 0.5,
		\freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
		\filfreq, Pseq([300], inf),
		\susTime, sustain,
		\amp, ampVal[0]
	).asStream;
};


changeAmpValue_1 = {|arg_val|
	ampVal[1] = arg_val;
	~pm2.stream = Pbind(
		\instrument,        \tak,
		\dur,    Pseq([
			onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
		]*timeMul, inf),
		\legato, 0.5,
		\freq, Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], inf),
		\filfreq, Pseq([300], inf),
		\susTime, Pseq([
			onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
		]*sustain, inf),
		\amp, ampVal[1]
	).asStream;
};

changeAmpValue_2 = {|arg_val|
	ampVal[2] = arg_val;
	~pm3.stream = Pbind(
		\instrument,        \tak,
		\dur,    Pseq([
			onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
		]*timeMul, inf),
		\legato, 0.5,
		\freq, Pseq([
			36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps,
			36.midicps, 40.midicps, 36.midicps, 35.midicps, 35.midicps
		], inf),
		\filfreq, Pseq([300], inf),
		// \freq, Pseq([100, 100, 100, 100]/4, inf),
		\susTime, Pseq([
			onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
		]*sustain, inf),
		\amp, ampVal[2]
	).asStream;
};

//--OSCFUNC--

9.do({|i| oscResps[i].free;});

oscResps[0] = OSCFunc({|msg, time, addr, recvPort|
	// msg[1].postln;
	susVal = msg[1];
	tempoVal = msg[2];
	tempoVal.postln;
	changeSustainValue.value(susVal);
	changeTempoValue.value(tempoVal);

}, '/3/xy');

oscResps[1] = OSCFunc({|msg, time, addr, recvPort|

		if (msg[1] == 1, {
			ampVal[0] = 70;
			},
			{ampVal[0] = 0;});
		changeAmpValue_0.value(ampVal[0]);

}, '/3/toggle1');

oscResps[2] = OSCFunc({|msg, time, addr, recvPort|

		if (msg[1] == 1, {
			ampVal[1] = 70;
			},
			{ampVal[1] = 0;});
		changeAmpValue_1.value(ampVal[1]);

}, '/3/toggle2');

oscResps[3] = OSCFunc({|msg, time, addr, recvPort|

		if (msg[1] == 1, {
			ampVal[2] = 70;
			},
			{ampVal[2] = 0;});
		changeAmpValue_2.value(ampVal[2]);

}, '/3/toggle3');

)



(
//min solo
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1, ampMul = 200, ampVal = 25,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0,
tmp = 1.0;


~pm1 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat
	]*timeMul*tmp, inf),
	\legato, 0.5,
	\freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, 0.6*tmp,
	\amp, ampVal
);


~pm2 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
	]*timeMul, inf),
	\amp, ampVal
);


~pm3 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*8
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps,
		36.midicps, 40.midicps, 36.midicps, 35.midicps, 35.midicps
	], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat*2, onebeat*2, onebeat*2, onebeat*2, onebeat*6
	]*timeMul, inf),
	\amp, ampVal
);


~pm4 = Pbind(
	\instrument,        \hat,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([
		52.midicps, 50.midicps, 52.midicps, 50.midicps,
		52.midicps, 50.midicps, 55.midicps, 50.midicps
	], inf),
	\filfreq, Pseq([1300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul, inf),
	\amp, 18
);

~pm5 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul, inf),
	\legato, 0.1,
	\freq,
	Pseq([
		Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], 1),
		Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], 1),
		Pseq([36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps], 1),
		Pseq([52.midicps, 50.midicps, 48.midicps, 50.midicps], 1),
		Pseq([52.midicps, 55.midicps, 50.midicps, 50.midicps, 44.midicps], 1)
	], inf),

	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul, inf),
	\amp,
	Pseq([
		Pseq([1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1/4, 1/4, 1/4, 1/4], 1),
		Pseq([1/4, 1/4, 1/4, 1/4, 1], 1)
	]*ampVal, inf)

);


~pm6 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul*2, inf),
	\legato, 0.1,
	\freq,
	Pseq([
		Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], 1),
		Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], 1),
		Pseq([36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps], 1),
		Pseq([52.midicps, 50.midicps, 48.midicps, 50.midicps], 1),
		Pseq([52.midicps, 55.midicps, 50.midicps, 50.midicps, 44.midicps], 1)
	], inf),

	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul*2, inf),
	\amp,
	Pseq([
		Pseq([1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1/4, 1/4, 1/4, 1/4], 1),
		Pseq([1/4, 1/4, 1/4, 1/4, 1], 1)
	]*ampVal, inf)

);

~pm7 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul*tmp, inf),
	\legato, 0.1,
	\freq,
	Pseq([
		Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], 1),
		Pseq([29.midicps, 33.midicps, 29.midicps, 28.midicps, 24.midicps], 1),
		Pseq([24.midicps, 28.midicps, 24.midicps, 23.midicps, 19.midicps], 1),
		Pseq([40.midicps, 38.midicps, 36.midicps, 38.midicps], 1),
		Pseq([40.midicps, 43.midicps, 38.midicps, 38.midicps, 32.midicps], 1)
	], inf),

	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul*tmp, inf),
	\amp,
	Pseq([
		Pseq([1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1/4, 1/4, 1/4, 1/4], 1),
		Pseq([1/4, 1/4, 1/4, 1/4, 1], 1)
	]*ampVal, inf)

);



~pm8 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul*tmp, inf),
	\legato, 0.1,
	\freq,
	Pseq([
		Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], 1),
		Pseq([41.midicps, 45.midicps, 41.midicps, 40.midicps, 36.midicps], 1),
		Pseq([36.midicps, 40.midicps, 36.midicps, 35.midicps, 31.midicps], 1),
		Pseq([52.midicps, 50.midicps, 48.midicps, 50.midicps], 1),
		Pseq([52.midicps, 55.midicps, 50.midicps, 50.midicps, 44.midicps], 1)
	], inf),

	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, Pseq([
		onebeat, onebeat, onebeat, onebeat
	]*timeMul*tmp, inf),
	\amp,
	Pseq([
		Pseq([1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1, 1, 1, 1, 1], 1),
		Pseq([1/4, 1/4, 1/4, 1/4], 1),
		Pseq([1/4, 1/4, 1/4, 1/4, 1], 1)
	]*ampVal, inf)

);


~pm9 = Pbind(
	\instrument,        \tak,
	\dur,    Pseq([
		onebeat
	]*timeMul*tmp, inf),
	\legato, 0.5,
	\freq, Pseq([28.midicps, 28.midicps, 28.midicps, 40.midicps], inf),
	\filfreq, Pseq([300], inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, 0.6*tmp,
	\amp, ampVal
);

)
