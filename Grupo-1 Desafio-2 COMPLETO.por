/*O programa � um sistema de 3 fases que deve ser executado at� o usu�rio escolher a op��o de sair.
    Fase 1-> {O usu�rio poder� inserir ou remover um n�mero real em um vetor de tamanho 10. 0 � considerado um espa�o vazio no vetor.
              A inser��o e remo��o aconteceram no espa�o vazio mais para esquerda sempre.
              A inser��o n�o pode ocorrer se o vetor estiver cheio, e a remo��o n�o pode ocorrer se o vetor estiver vazio. }

    Fase 2-> {O usu�rio ir� escolher um conjunto: <n�meros primos>, <n�meros pares> ou <n�meros �mpares>; Ent�o o sistema remover�
              os n�meros que n�o fazem parte do conjunto escolhido, empurrar� os n�meros restantes para a esquerda do vetor e
              deixar� o vetor ordenado crescentemente (com os zeros para a direita do vetor).
              Exemplo: <n�meros �mpares>: [2, 6, 7, 4, 5, 3, 0, 0, 0, 0] -> [3, 5, 7, 0, 0, 0, 0, 0, 0, 0] }

    Fase 3-> {O usu�rio ir� escolher uma opera��o: <Adi��o>, <Subtra��o>, <Multiplica��o> ou <Divis�o>. Em seguida o programa ir�
              realizar a opera��o selecionada entre todos os n�meros do vetor, em ordem crescente.
              Exemplo: <Divis�o>: [7, 5, 3, 0, 0, 0, 0, 0, 0, 0] -> 3 / 5 / 7 = 0.08571428571428572 }
    Cada fase deve ser uma fun��o.
    Durante o a conclus�o da fase 3, o resultado deve ser exibido
    e o usu�rio ter� que escolher entre voltar para a fase 1 com um vetor vazio
    ou finalizar o programa.
    */
programa{
  funcao inicio(){
    mainLoop()
    mostrarVetor()
}

  funcao mainLoop(){
    real vetor[10] = {0,0,0,0,0,0,0,0,0,0}
    inteiro sizeTracker = 0
    logico continuar

    enquanto(verdadeiro){
      sizeTracker = fase1(vetor, sizeTracker)
      sizeTracker = fase2(vetor, sizeTracker)
      fase3(vetor, sizeTracker)
      escreva("Voc� deseja repetir o programa?\n1 = Sim\n0 = N�o\n-> ")
      leia(continuar)
      se(nao(continuar)){
        retorne
      }
      escreva("\n")
      mostrarVetor(vetor)
      escreva("\n")
    }
  }

  funcao mostrarVetor(real vetor[]){
	  escreva("Vetor[] = {")
    para(inteiro i = 0; i < 10; i++){
	    escreva(vetor[i])
	  se(i < 9){
	    escreva(", ")
	  }
	}
	  escreva("}\n")
  }

  funcao inteiro ordenar(real vetor[], inteiro sizeTracker){
    real aux
    para(inteiro i = 0; i < sizeTracker; i++){
      para(inteiro j = 0; j < sizeTracker-1; j++){
        se(vetor[j] == 0){
          vetor[j] = vetor[j+1]
          vetor[j+1] = 0.0
        }
      }
    }
    para(i = 0; i < sizeTracker; i++){
      se(vetor[i] == 0){
        sizeTracker = i
        pare
      }
    }
    //bubble sort
    para(i = 1; i < sizeTracker; i++){
      para(j = 0; j < sizeTracker - 1; j++){
        se(vetor[j] > vetor[j + 1]){
          aux = vetor[j]
          vetor[j] = vetor[j + 1]
          vetor[j + 1] = aux
        }
      }
    }
    retorne sizeTracker
  }


  funcao inteiro fase1(real vetor[], inteiro sizeTracker){
    logico continuar = verdadeiro
    inteiro opcao
    real insValue
    escreva("----------Fase 1----------\n")

    enquanto(continuar){
      escreva("Escolha uma op��o:\n1 = Inserir\n2 = Remover\n3 = Pr�xima fase\n-> ")
      leia(opcao)
      escolha(opcao){
        caso 1:
          se(sizeTracker < 10){
            escreva("\nDigite o valor real a ser inserido: ")
            leia(insValue)
            vetor[sizeTracker] = insValue
            mostrarVetor(vetor)
            sizeTracker++
          }senao{
            escreva("\nVetor cheio.\n\n")
          }
        pare

        caso 2:
          se(sizeTracker > 0){
            sizeTracker--
            vetor[sizeTracker] = 0.0
            mostrarVetor(vetor)
          }senao{
            escreva("\nVetor vazio.\n\n")
          }
        pare

        caso 3:
          continuar = falso
        pare
      }
      escreva("\n")
    }
    retorne sizeTracker
  }

  funcao inteiro fase2(real vetor[], inteiro sizeTracker){
    inteiro i, j, opcao
    escreva("----------Fase 2----------\n")

    escreva("Escolha uma op��o:\n1 = <n�meros primos>\n2 = <n�meros pares>\n3 = <n�meros �mpares>\n-> ")
    leia(opcao)

    escolha(opcao){
      caso 1:
	      escreva("\nAntes: ")
		    mostrarVetor(vetor)
        para(i = 0; i < sizeTracker; i++){
          para(j = 2; j < vetor[i]; j++){
            se(vetor[i] % j == 0){
              vetor[i] = 0.0
              pare
            }
          }
          se(vetor[i] == 1){
            vetor[i] = 0.0
          }
        }
        sizeTracker = ordenar(vetor, sizeTracker)
        escreva("\nDepois: ")
        mostrarVetor(vetor)
      pare
      caso 2:
        escreva("\nAntes: ")
		    mostrarVetor(vetor)
        para(i = 0; i < sizeTracker; i++){
          se(vetor[i] % 2 != 0){
            vetor[i] = 0.0
          }
        }
        sizeTracker = ordenar(vetor, sizeTracker)
        escreva("\nDepois: ")
        mostrarVetor(vetor)
      pare
      caso 3:
        escreva("\nAntes: ")
		    mostrarVetor(vetor)
        para(i = 0; i < sizeTracker; i++){
          se(vetor[i] % 2 == 0){
            vetor[i] = 0.0
          }
        }
        sizeTracker = ordenar(vetor, sizeTracker)
        escreva("\nDepois: ")
        mostrarVetor(vetor)
      pare
    }
    retorne sizeTracker
  }

  funcao fase3(real vetor[], inteiro sizeTracker){
    inteiro opcao, i
    real resultado = vetor[0]
    escreva("\n----------Fase 3----------\n")

    escreva("Escolha uma op��o:\n1 = <Adi��o>\n2 = <Subtra��o>\n3 = <Multiplica��o>\n4 = <Divis�o>\n-> ")
    leia(opcao)

    escolha(opcao){
      caso 1:
        escreva("\nAdi��o de todos os n�meros do vetor: ")
        para(i = 1; i < sizeTracker; i++){
          resultado += vetor[i]
        }
        escreva(resultado)
      pare
      caso 2:
        escreva("\nSubtra��o de todos os n�meros do vetor: ")
        para(i = 1; i < sizeTracker; i++){
          resultado -= vetor[i]
        }
        escreva(resultado)
      pare
      caso 3:
        escreva("\nMultiplica��o de todos os n�meros do vetor: ")
        para(i = 1; i < sizeTracker; i++){
          resultado *= vetor[i]
        }
        escreva(resultado)
      pare
      caso 4:
        escreva("\nDivis�o de todos os n�meros do vetor: ")
        para(i = 1; i < sizeTracker; i++){
          resultado /= vetor[i]
        }
        escreva(resultado)
      pare
    }
    escreva("\n\n")
  }
}

