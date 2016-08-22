a.release(0.1);a = Synth(\ten, [\freq, 1600, \amp, 0.9, \filfreq, 100, \susTime, 70, \nf, 1/5, \nff, 0.7]);
a.set(\freq, 2, \nf, 1/2);
a.set(\freq, 1/2, \nf, 1/3);
a.set(\freq, 1/2, \nf, 1/5);
a.set(\freq, 1/2, \nf, 1/5);
a.release(0.1);


// 의자씬 소리
d = Synth(\ten);
d.free;