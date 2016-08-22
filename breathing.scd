(
//Synth 1
SynthDef(\bass2, {| amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1,
	freqs = #[220, 440, 880, 1760],
    amps=#[0.1, 0.23, 0.12, 0.05],
    phases=#[1, 1.5, 2, 2.5]|
	var env, sig, lowcut_sig;
	env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
	sig = DynKlang.ar(`[freqs, amps, phases]);
	sig = RLPF.ar(sig, lf, rq);
	lowcut_sig = HPF.ar(sig, 100);
	// Out.ar(0, Pan2.ar(sig * env, 0, amp));
	Out.ar(0, Pan2.ar(lowcut_sig * env, 0, amp));
}).add;


//Synth 2
SynthDef(\bass3, {| amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1, nf = 20,
	freqs = #[1280, 1760, 3000, 4200],
    amps=#[0.1, 0.23, 0.12, 0.05],
    phases=#[1, 1.5, 2, 2.5]|
	var env, sig, lowcut_sig, sig2;
	env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
	sig = DynKlang.ar(`[freqs, amps, phases]);
	sig = RLPF.ar(sig, lf, rq);
	sig2 = LFNoise0.kr(nf);
	lowcut_sig = HPF.ar(sig, 100);
	// Out.ar(0, Pan2.ar(sig * env, 0, amp));
	Out.ar(0, Pan2.ar(lowcut_sig * env * sig2, 0, amp));
}).add;

SynthDef(\bass4, {| amp = 0.2, lf = 100, rq = 0.9, envdur = 0.4, gate = 1, nf = 20,
	freqs = #[1280, 760, 2000, 3200],
    amps=#[0.1, 0.23, 0.12, 0.05],
    phases=#[1, 1.5, 2, 2.5]|
	var env, sig, lowcut_sig, sig2;
	env = EnvGen.kr(Env.sine(envdur), gate, doneAction: 2);
	sig = DynKlang.ar(`[freqs, amps, phases]);
	sig = RLPF.ar(sig, lf, rq);
	sig2 = LFNoise0.kr(nf);
	lowcut_sig = HPF.ar(sig, 100);
	// Out.ar(0, Pan2.ar(sig * env, 0, amp));
	Out.ar(0, Pan2.ar(lowcut_sig * env * sig2, 0, amp));
}).add;

)


c = Synth(\bass3, [\lf, 500, \amp, 2, \envdur, 14, \nf, 7]); // 숨쉬기 씬 :들숨
c = Synth(\bass4, [\lf, 400, \amp, 2, \envdur, 8, \nf, 4]); // 숨쉬기 씬 :날숨
d = Synth(\bass2, [\amp, 0.3, \envdur, 8]);