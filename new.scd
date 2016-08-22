a.release(0.1);a = Synth(\ten, [\freq, 1600, \amp, 0.9, \filfreq, 100, \susTime, 70, \nf, 1/5, \nff, 0.7]);
a.set(\freq, 2, \nf, 1/2);
a.set(\freq, 1/2, \nf, 1/3);
a.set(\freq, 1/2, \nf, 1/5);
a.set(\freq, 1/2, \nf, 1/5);
a.release(0.1);

(
SynthDef(\ten, {| freq = 500, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1, nff = 2.5,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7|
	var sig, env, sig2, del, mod, lowcut_sig, lowcut_sig2, gateSig;
	// sig = LFSaw.ar(freq);
	sig = LFNoise0.ar(freq);
	sig = LPF.ar(sig, filfreq);

	// sig2 = Impulse.ar(0, mul: amp2);
	sig2 = LFNoise0.kr(nf);
	// env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	gateSig = LFNoise0.kr(nff);
	env = EnvGen.kr(Env.linen(sustainTime: LFNoise0.kr(2).range(0.01, 0.1), releaseTime: 0.05, curve: 9), gateSig, doneAction: 0);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, 100);
	lowcut_sig2 = HPF.ar(sig2, 100);

	Out.ar(0, Pan2.ar((sig + sig2) * env, pan, amp));
	// Out.ar(0, Pan2.ar((sig + lowcut_sig2) * env, pan, amp));
}).add;
)

d = Synth(\ten);
d.free;

~pstool = Pbind(
	\instrument,        \dds,
	\dur,    Pseq([
		onebeat, onebeat/3, onebeat/3, onebeat/3, onebeat, onebeat, onebeat, onebeat, onebeat, onebeat
	]*timeMul, inf),
	\legato, 0.5,
	\freq, Pseq([100, 500, 300, 200]/4, inf),
	// \freq, Pseq([100, 100, 100, 100]/4, inf),
	\susTime, 0.01,
	\amp, 0.4*ampMul + 20
).play;