(
~ment = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/ment.wav");
// ~ment.play;
~bolero = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/bolero.wav");
// ~bolero.play;

~love = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/love.wav");
// ~love.play;

~karmen = Buffer.read(s, "/Users/giy/Desktop/2016_08_ap/karmen.wav");
// ~karmen.play;
)


(
SynthDef(\mentbr,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 1 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~ment, BufRateScale.kr(~ment)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~ment.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\bolero,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 1 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~bolero, BufRateScale.kr(~bolero)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~bolero.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\love,
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
}).add;

)



e.free;
e = Synth(\bolero, [\amp, 1]); //bolero


e = Synth(\love, [\amp, 0.1]); //love - "지금부터 박스 개봉을 시작하겠습니다" 후에 끝!
e = Synth(\mentbr, [\amp, 0.6]); //ment
e = Synth(\karmen, [\amp, 0.3]); //karmen


