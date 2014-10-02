class Compilador{

	public static void main(String[]args)
	{	
		ArvoreSintatica arv=null;
	
		try{

			AnaliseLexica al = new AnaliseLexica(args[0]);
			Parser as = new Parser(al);
			int op = 0;

			if (args.length > 1){
				if ("codegen".equals(args[1].toLowerCase()))
					op = 0;
				else
					if ("interpretador".equals(args[1].toLowerCase()))
						op = 1;
					else{
						System.err.println(args[1] + " é um parâmetro inválido.");
        				System.exit(1);
        			}
			}

			arv = as.parseProg();

			CodeGen backend = new CodeGen();

			if (op == 1){
				try{
					String out = backend.interpretador(arv);
					System.out.println(out);
				} catch (Exception e){
					System.out.println(e);
				}
			} else {
				String codigo = backend.geraCodigo(arv);
				System.out.println(codigo);
			}

		}catch(Exception e)
		{			
			System.out.println("Erro de compilação:\n" + e);
		}



	}
}
