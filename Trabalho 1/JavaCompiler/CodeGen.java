class CodeGen{

	
	String geraCodigo (ArvoreSintatica arv) throws Exception
	{
		try{
			return (geraCodigo2(arv) + "PRINT");
		} catch (Exception e){
			throw e;
		}
	}
	String geraCodigo2 (ArvoreSintatica arv) throws Exception
	{

	if (arv instanceof Mult)
		return (geraCodigo2(((Mult) arv).arg1) + 
			geraCodigo2(((Mult) arv).arg2) +
			"MULT\n");

	if (arv instanceof Soma)
		return (geraCodigo2(((Soma) arv).arg1) + 
			geraCodigo2(((Soma) arv).arg2) +
			"SUM\n");

	if (arv instanceof Sub)
		return (geraCodigo2(((Sub) arv).arg1) + 
			geraCodigo2(((Sub) arv).arg2) +
			"SUB\n");

	if (arv instanceof Div) {
		try {
			return (geraCodigo2(((Div) arv).arg1) + 
				geraCodigo2(((Div) arv).arg2) +
				"DIV\n");
		} catch (Exception e){
			throw e;
		}
	}

	if (arv instanceof Num)
		return ("PUSH "  + ((Num) arv).num + "\n");

	return "";
	}

	String interpretador(ArvoreSintatica arv) throws Exception{
		try{
			return ("Resultado da expressão é: "+Float.toString(interpretador2(arv)));
		} catch (Exception e){
			throw e;
		}
	}

	float interpretador2(ArvoreSintatica arv) throws Exception {


		if (arv instanceof Mult)
			return (interpretador2(((Mult) arv).arg1) * 
			interpretador2(((Mult) arv).arg2));

		if (arv instanceof Soma)
			return (interpretador2(((Soma) arv).arg1) +
			interpretador2(((Soma) arv).arg2));

		if (arv instanceof Div){
			try{
				return (interpretador2(((Div) arv).arg1) / 
				interpretador2(((Div) arv).arg2));
			} catch (Exception e){
				throw e;
			}
		}

		if (arv instanceof Sub)
			return (interpretador2(((Sub) arv).arg1) -
			interpretador2(((Sub) arv).arg2));

		if (arv instanceof Num)
			return (((Num) arv).num);

		return 0;
	}
}
