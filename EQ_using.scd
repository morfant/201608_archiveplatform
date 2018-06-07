(// eq 사용법

~masterEQ = ChannelEQ.new(2, s, 0, 0);
~masterEQ.gui.onSelect('x_telephone');
~masterEQ.gui.onSelect('x_flat');
~masterEQ.gui.onSelect('x_loudness');
~masterEQ.gui.onSelect('text');
~masterEQ.gui.onSelect('moo');
~masterEQ.gui.onSelect('string');
~masterEQ.gui.onSelect('ending');

)



a = {WhiteNoise.ar(0.5)!2}.play(outbus: 0);

s.freeAll
s.sendMsg('\n_free', 1005)