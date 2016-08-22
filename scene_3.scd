~recPath = "/Users/giy/Music/SuperCollider Recordings/00_AudianceInterview.aiff";

//--------------- PLAY -------------------
//Play interviews - 버퍼 내용이 바뀌면, synth를 한번 더 add 한 후에 해야 한다.

~buf = Buffer.read(s, ~recPath);


(
SynthDef(\br,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 1 |
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
)


//페이드 인으로 재생. 암전 후에 조금 더 틀다가 페이드아웃.
~bufPlay = Synth(\br, [\amp, 0.8]);
~bufPlay.set(\amp, 0.5);

~bufPlay.free;
