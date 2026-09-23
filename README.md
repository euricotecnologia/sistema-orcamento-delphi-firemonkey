# Sistema Orçamento - Delphi FireMonkey

Aplicativo multiplataforma para criação e acompanhamento de orçamentos e ordens de serviço. Desenvolvido em Delphi com FireMonkey, o sistema reúne clientes, serviços, atendentes, formas de pagamento, assinatura digital e emissão de documentos em uma interface preparada para Android e Windows.

## Principais recursos

- Cadastro e pesquisa de clientes.
- Cadastro de serviços, valores e atendentes.
- Controle de comissão por atendente.
- Criação de orçamentos e ordens de serviço.
- Acompanhamento de registros abertos, finalizados e pendentes de pagamento.
- Valores de subtotal, desconto e total.
- Pagamentos em dinheiro, crédito, débito, boleto e cheque.
- Captura de assinatura digital do cliente.
- Geração de documentos em PDF.
- Configuração de acesso ao MySQL armazenada localmente em SQLite.

## Plataformas configuradas

- Android e Android 64 bits.
- Windows 32 e 64 bits.

## Tecnologias e dependências

- Delphi/RAD Studio com FireMonkey.
- UniDAC com provedor MySQL.
- FireDAC com driver SQLite.
- Componentes TMS FMX, incluindo captura de assinatura, teclado de senha e recursos de PDF.
- Biblioteca FGX e demais pacotes referenciados em `src/UnixV1.dproj`.

As bibliotecas comerciais ou de terceiros não estão incluídas. Instale versões compatíveis com o projeto e respeite suas respectivas licenças.

## Configuração

1. Instale os componentes exigidos pelo projeto.
2. Copie `src/db.example.db` para `src/db.db` antes da compilação ou implantação.
3. Revise `src/UnixV1.deployproj` e confirme que `db.db` será enviado para o diretório de documentos do aplicativo.
4. Prepare um banco MySQL com as tabelas utilizadas pelo sistema.
5. Na tela de configuração, informe servidor, banco, usuário, senha e porta.
6. Revise os caminhos de recursos gravados nos arquivos `.fmx` e ajuste-os ao seu ambiente de desenvolvimento quando necessário.

> O pacote original não continha um script de criação do banco MySQL. O arquivo `db.example.db` contém apenas a estrutura SQLite local e uma conexão de exemplo sem senha.

## Segurança

O banco local original não foi publicado porque armazenava configuração de rede e poderia conter dados operacionais. O repositório inclui somente uma base vazia de exemplo, sem clientes, pedidos, usuários ou credenciais reais.

## Indicadores visuais

<p>
  <img src="img/novo.png" alt="Novo orçamento" width="90">
  <img src="img/abertos.png" alt="Orçamentos abertos" width="90">
  <img src="img/finalizados.png" alt="Orçamentos finalizados" width="90">
  <img src="img/fiados.png" alt="Pendências" width="90">
  <img src="img/check.png" alt="Concluído" width="90">
</p>

