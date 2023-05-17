

import Foundation
var vetor: [String] = []
var vetor_senha: [String] = []

var opcao = Int()
var element_add = String()
var element_pesquisa = String()
var element_remove = String()
var index = 0
var index_remove = 0
var index_pesquisa = 0



var element_add_senha = String()
var element_pesquisa_senha = String()
var element_remove_senha = String()
var index_cell = 0
var index_remove_senha = 0
var index_pesquisa_senha = 0


repeat{
print("\n----MENU----\n1- Cadastrar nome de usuário \n2- Excluir nome usuário  \n3- Listar nome de usuário  \n4-  Consultar nome de usuário \n5-  Cadastrar senha \n6-  Excluir senha \n7-  Listar senha \n8-  Consultar senha \n9- Sair\n")

print("Escolha uma opção: ")
opcao = ((Int(readLine()!)!))

switch opcao {
  case 1:
    inserir()
  case 2:
    retirar()
  case 3:
    listar_vetor()
  case 4:
    pesquisa()
  case 5:
   // print("Em manutenção")
    inserir_senha()
  case 6:
 //   print("Em manutenção")
    retirar_senha()
  case 7:
  //  print("Em manutenção")
    listar_vetor_senha()
  case 8:
  //  print("Em manutenção")
    pesquisa_senha()
  case 9:
    break
  default:
    print("Opção inválida")
}
}while((opcao != 1 || opcao != 2 || opcao != 3 || opcao != 4) && opcao != 9)


//////////////////////////////////////////////
func inserir() {
  prompt_add(aceita_vazio: 0)
}
func inserir_senha() {
  prompt_add_senha(aceita_vazio: 0)
}

////////////////////////////////////////////////////

func pesquisa() {
  pesq_elementos_vetor()
}

func pesquisa_senha() {
  pesq_elementos_vetor_senha()

}

///////////////////////////////////////////////////

func retirar() {
  prompt_remove(aceita_vazio: 0)
  remove_nome(vetor: &vetor, nome_para_remover: element_remove)
}

func retirar_senha() {
  
  remove_senha()
}
//////////////////////////////////////////////////

func listar_vetor() {
  print(vetor)
}

func listar_vetor_senha() {
  print(vetor_senha)
}

///////////// Funcoes Cadastro /////////////

func prompt_add(aceita_vazio: Int) {
  repeat{
    
     print("\nDigite o nome de usuário a ser cadastrado: ")
     element_add = ((readLine() ?? " "))
    // names.append((readLine() ?? " "))
    
  }while(aceita_vazio == 1 || verifica_texto(str: element_add) == 1)

  vetor.append(element_add)
}

func prompt_add_senha(aceita_vazio: Int) {
  repeat{
    
     print("\nDigite o senha a ser cadastrado: ")
     element_add_senha = ((readLine() ?? " "))
    // names.append((readLine() ?? " "))
    
  }while(aceita_vazio == 1 || verifica_texto(str: element_add_senha) == 1)

  vetor_senha.append(element_add_senha)
}


///////////// Funcoes Remove /////////////

func prompt_remove(aceita_vazio: Int) {
  repeat{
    
     print("\nDigite o nome de usuário a ser removido*: ")
     element_remove = ((readLine() ?? " "))
    
    
  }while(aceita_vazio == 1 || verifica_texto(str: element_remove) == 1)
}



func remove_nome(vetor:inout [String], nome_para_remover: String){
  for i in vetor {
    if i == nome_para_remover {
      vetor.remove(at: index_pesquisa)
    }
    index_pesquisa += 1
  }
}

func remove_senha(){
  print("\nDigite o senha a ser removido*: ")
  element_remove_senha = ((readLine() ?? " "))
  
  for i in vetor_senha {
    if i == element_remove_senha {
      vetor_senha.remove(at: index_pesquisa_senha)
    }
    index_pesquisa_senha += 1
  }
}
////////////////////////////////////////////////


func verifica_texto(str: String) -> Int {
  
let len = str.count

  if(len < 1){
    return 1
  }
  return 0
}


func pesq_ultimo(vetor: inout [String], element_busca: String) {
  let meio = vetor.count / 2
    for i in 0..<meio {
        let j = vetor.count - i - 1
        let temp = vetor[i]
        vetor[i] = vetor[j]
        vetor[j] = temp
    }

    for elementos in vetor {
      if elementos == element_busca {
      vetor.remove(at: index)
    }
    index += 1
  }

}
func pesq_elementos_vetor(){
  var teste_nome = false

  print("\nDigite o nome de usuário que deseja pesquisar: ")
     element_pesquisa = ((readLine() ?? " "))
  
  for i in vetor {
    if i == element_pesquisa {
      teste_nome = true
    }
    index_pesquisa += 1
  }
  if (teste_nome != false){
    print("Este nome de usuário está na lista! ")
  }
  else{
    print("Este nome de usuário não está na lista! ")
  }
}

func pesq_elementos_vetor_senha(){

  var teste = false

  print("\nDigite a senha que deseja pesquisar: ")
     element_pesquisa_senha = ((readLine() ?? " "))
  
  for i in vetor_senha {
    if i == element_pesquisa_senha {
      teste = true
    }
    index_pesquisa_senha += 1
  }
  if (teste != false){
    print("Esta senha está na lista! ")
  }
  else{
    print("Esta senha não está na lista! ")
  }
}





func processURL(urlString: String) {
    if let url = URL(string: urlString) {
        // Faça qualquer coisa que você precise com a URL aqui
        print("URL válida: \(url.absoluteString)")
        
        // Exemplo de uso: fazer uma requisição HTTP
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Faça o processamento dos dados aqui
                print("Dados recebidos: \(data)")
            }
        }
        
        task.resume()
    } else {
        print("URL inválida")
    }
}

// Exemplo de uso da função com entrada do usuário
print("Digite uma URL:")
if let urlString = readLine() {
    processURL(urlString: urlString)
}






struct Data: Codable {
    var vetor: [String] = []
    var vetor_senha: [String] = []
}

struct CreateData {
    func createFile(with data: Data, senha: String) -> Bool{
        return true
    }
    func removeFile(at path: String) -> Bool { return true}
    func updateFile(at path: String) -> Bool { return true}
    func retriveFile(at path: String) -> Data? {return nil}
}



  
