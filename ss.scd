(
var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1/4, ampMul = 10,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0;


~ps1 = Pbind(
	\instrument,        \ss,
	\dur,    Prand([
		onebeat, onebeat*2, onebeat*3, onebeat*4, onebeat/2
	], inf),
	\legato, 0.5,

	\freq,
	Prand([14800, 14500], inf),
	// Pgauss(14000, 800, inf),
	// Ppoisson(1, inf) * 14000,

	// Pseq([
	// 	Pseq([13900], 10),
	// 	Pseq([14500], 10)
	// ], inf),



	\envdur, 0.1,
	\susTime, 0.01,
	\amp, 10
	// + Pwhite(0.1, 10, inf)
	// \amp,  Pseq([
	// 	Pseq((0..1)/10 * 7, 10),
	// 	Pseq((1..0)/10 * 7, 10)
	// ], inf),
);
)



//존재씬
~ps1.play;


(
SynthDef(\ss, {
	arg amp = 1, freq = 13900, freq2 = 32, gate = 1, filfreq = 1000, rq = 0.5;
	var sig, sig2, fil, env, out;
	// sig = PinkNoise.ar(1);
	// sig = WhiteNoise.ar(1);
	sig = Impulse.ar(freq);
	// sig = LFPulse.ar(7000);
	// sig2 = LFNoise0.kr(freq);
	sig2 = Dust.kr(MouseY.kr(5, 80));
	fil = BPF.ar(sig, filfreq, rq);
	env = EnvGen.kr(Env.perc(0.001, 3, 1, -4), gate, doneAction: 2);

	out = Out.ar(0, Pan2.ar(fil*sig2*env, 0, amp ));
	// out = Out.ar(0, Pan2.ar(fil*sig2*env, 0, MouseX.kr(0, 10) ));
	}
).add;

)

a = Synth(\ss);

a.set(\amp, 9, \filfreq, 5000, \rq, 0.01);


13900/32
14500/26