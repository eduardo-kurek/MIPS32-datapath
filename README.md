# Caminho de dados - MIPS32
![datapath](https://github.com/user-attachments/assets/1812b4cb-39a0-43bd-be72-2b8117119f4a)
Esse projeto foi realizado na disciplina de **Arquitetura e Organização de Computadores** (2024/1) do curso Ciência da Computação da Universidade Tecnológica Federal do Paraná | UTFPR-CM. O objetivo era de construir um datapath simples de um processador da arquitetura MIPS32. Para isso, utilizamos o simulador *logisim* para observar as alterações dos sinais lógicos.

# Como executar um código
Para executar algum código nesse processador, é necessário seguir os seguintes passos:
  
* Escreva o código assembly na arquitetura MIPS32. Não é recomendado utilizar um compilador para fazer isso, pois ele considera todas as partes do arquivo-objeto na hora da compilação. Considerando também a função *main()* e chamadas do sistema operacional, que se tornam incompatíveis com o processador simulado. Escreva o código assembly de forma crua, sem chamar a função main e sem se preocupar com os parametros dela. Caso você escreva funções, é importante garantir que haja a instrução `j EXIT` ao final do código principal, para que as funções não sejam executadas por acidente;
  
* Converta o código assembly para código de máquina. Se for fazer manualmente, siga rigorosamente os modos de endereçamento e *funct* descritos pela arquitetura (inclusive endereço inicial para .text). Eu recomendo fortemente que utilize o simulador MARS para fazer isso, você consegue buildar e depois extrair o código de máquina em formato hexadecimal. O simulador MARS considera os endereços de *$pc* e *$sp* iguais aos descritos na arquitetura, e seu código também devera seguir essa convenção para que funcione corretamente no datapath.

* Salve o código de máquina com o seguinte formato:

```txt
v2.0 raw
23bd1fff
08100000
1048574*0

COLOQUE O SEU CÓDIGO AQUI
```

Esse arquivo não deve conter extensão nenhuma. É o arquivo que usaremos para carregar o programa na memória de instruções. A instrução `23bd1fff` inicia o registrador *$sp* com o valor 1fff. A instrução `08100000` é um *jump* para o endereço 0x00400000, esse jump é realizado para sincronizar a posição das instruções com à do MARS, assim todos os branchs que funcionam no MARS, também funcionam no datapath. A linha `1048574*0` preenche as instruções com 0 até chegar no endereço de inicío do programa. As instruções também podem estar separas por espaço, ao invés de quebra de linha.

* Baixe a pasta `Circuitos` do projeto;

* Abra o arquivo `Datapath.circ`;

* Dê dois cliques na memória de instruções que está no circuito `main`. Deve ser a memória que está na main, não clique na memória da árvore de pastas;

* Carregue o arquivo gerado nos passos anteriores dentro da memória de instruções;

* Fique à vontade para editar os valores da memória de dados que será imporante para o seu programa;

Pronto! Seu programa está pronto para ser executado, agora basta você executar o clock do logisim e ver a mágica acontecer.

# Limitações
Nem todas as instruções do MIPS32 foram implementadas. Segue uma lista das instruções que funcionam nesse datapath.

* `add`, `sub`, `slt`, `sll`, `srl`, `and`, `or`, `nor` e `jr` do formato R;
* `j` e `jal` do formato J;
* `addi`, `beq`, `bne`, `lw` e `sw` do formato I;
