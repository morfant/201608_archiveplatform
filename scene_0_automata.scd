(
fork{
	5.wait;
	15.do{|i|

		b = Synth(\dd, [\atTime, (0.1 + 0.1.rand), \amp, 4.2]); //진주 떨어 뜨릴 때
		(5 + (3.rand - 1)).wait;
	}
}
)


3 + (3.rand - 1);

0.1 + 0.1.rand