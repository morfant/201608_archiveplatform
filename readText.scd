(
//Synth 4
SynthDef(\dds, {| freq = 1, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7|
	var sig, env, sig2, del, mod, lowcut_sig, lowcut_sig2;
	sig = Blip.ar(freq);
	sig = LPF.ar(sig, filfreq);

	// sig2 = Impulse.ar(0, mul: amp2);
	sig2 = LFNoise0.kr(nf);
	env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, 100);
	lowcut_sig2 = HPF.ar(sig2, 100);

	Out.ar(0, Pan2.ar((sig + sig2) * env, pan, amp));
	// Out.ar(0, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;

)


//텍스트 읽을 때
a.free;a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 40, \nf, 3]);
a.free;a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 40, \nf, 9]); // 마지막 민하씨 읽을 때는 nf를 7-9정도로 높인다.
a.free;a = Synth(\dds, [\freq, 700, \amp, 0.7, \filfreq, 300, \susTime, 40, \nf, 9]); // 민씨 움직이며 텍스트 읽을 때 - 이것도 텍스트니까

a.free;


{BrownNoise.ar(1)!2}.play;