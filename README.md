This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.js`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.


Descrição geral do projeto



Ideia do Projeto:

O conceito por trás do projeto da ZobooWallet é inovador e promissor. Propomos a criação de um aplicativo e um site integrados que utilizam uma sofisticada Account Abstraction, permitindo não apenas transações diretas, mas também pagamentos parcelados, agregando praticidade e flexibilidade aos usuários.

Como Utilizar o App/Site:

Ao acessar o site através de um navegador, seja em um dispositivo móvel ou em um computador, os usuários são imediatamente recebidos pela página inicial. Neste espaço, destacam-se diversos botões que direcionam a experiência do usuário: "Home", "Join", "Launch App" e "Install APK". O botão "Join" oferece uma jornada de integração entre a carteira digital do usuário e o site, proporcionando a capacidade de realizar depósitos e transações com facilidade e segurança. Ao selecionar "Home", independentemente de onde o usuário esteja na página, ele será redirecionado para o topo, garantindo uma navegação fluida e intuitiva. O botão "Install APK" possibilita o download do aplicativo em uma variedade de dispositivos, desde celulares e tablets até computadores desktop e notebooks. Uma vez baixado, os usuários têm a conveniência de abrir o aplicativo diretamente da área de trabalho ou através de seus dispositivos móveis. Alternativamente, ao acessar o site, o botão "Launch App" encaminha os usuários para os respectivos aplicativos já baixados, garantindo uma transição perfeita entre plataformas. Ao explorar mais a fundo, rolando a página para baixo, os usuários encontram descrições detalhadas sobre os propósitos e funcionalidades do nosso aplicativo, oferecendo uma visão mais abrangente do que o ZobooWallet tem a oferecer e como pode melhorar suas experiências financeiras.

Explicação do Contrato:

O contrato inteligente transacaoParcelada foi desenvolvido para facilitar transações parceladas com garantia colateral em Ethereum (ETH). Ele utiliza um oráculo Chainlink para obter o preço do ativo subjacente, permitindo assim que as transações sejam ajustadas com base nas flutuações de preço em tempo real. O contrato tem como objetivo principal viabilizar transações parceladas com colateral em ETH. Ele foi projetado para permitir que os usuários criem transações divididas em várias parcelas, garantindo o pagamento através de ativos depositados como colateral. O contrato inclui uma estrutura de dados para armazenar informações sobre transações, como identificador, valor do ativo, número de parcelas, valor de cada parcela, valor total da transação, endereço do remetente e status de finalização. Há funções que permitem aos usuários criar novas transações parceladas, executar parcelas de transações, automatizar a execução de transações e gerenciar o colateral depositado. O contrato utiliza a interface AggregatorV3Interface do Chainlink para obter o preço do ativo subjacente em tempo real, garantindo a precisão das transações.

Benefício para o Comprador e Credor:

Ao adotar essa solução, os compradores podem desfrutar de uma série de vantagens significativas. Primeiramente, ao parcelar suas compras, têm a oportunidade de manter seus fundos disponíveis por um período mais longo em suas contas, proporcionando maior flexibilidade financeira e potencializando seu poder de compra. Além disso, ao garantir transações com colateral, reduz-se significativamente o risco de inadimplência, conferindo maior segurança tanto para o comprador quanto para o fornecedor de crédito. Os fornecedores de crédito também colhem benefícios substanciais com essa modalidade de transação. Ao oferecerem suporte financeiro para transações parceladas, têm a oportunidade de gerar retornos através de taxas de juros estipuladas no smart contract. Isso não apenas amplia suas oportunidades de investimento, mas também diversifica sua carteira de ativos, agregando valor e solidez ao seu portfólio. Em resumo, tanto o comprador quanto o credor se beneficiam do sistema de transações parceladas com garantia colateral de forma matematicamente mensurável. O comprador economiza em custos de oportunidade ao parcelar o pagamento, enquanto o credor recebe taxas de juros sobre o capital investido e minimiza o risco de inadimplência através da garantia colateral.





Project overview



Project Idea:

The concept behind the ZobooWallet project is innovative and promising. We propose the creation of an integrated application and website that use sophisticated Account Abstraction, allowing not only direct transactions but also installment payments, adding convenience and flexibility to users.

How to Use the App/Site:

When accessing the website through a browser, whether on a mobile device or a computer, users are immediately greeted by the homepage. In this space, there are various buttons that direct the user experience: "Home," "Join," "Launch App," and "Install APK." The "Join" button offers an integration journey between the user's digital wallet and the site, providing the ability to make deposits and transactions with ease and security. Meanwhile, selecting "Home" redirects the user to the top of the page, regardless of where they are on the page, ensuring smooth and intuitive navigation. The "Install APK" button allows users to download the application on a variety of devices, from mobile phones and tablets to desktop computers and notebooks. Once downloaded, users have the convenience of opening the application directly from the desktop or through their mobile devices. Alternatively, when accessing the site, the "Launch App" button directs users to the respective downloaded applications, ensuring a seamless transition across platforms. Delving deeper by scrolling down the page, users find detailed descriptions of the purposes and functionalities of our application, offering a more comprehensive view of what ZobooWallet has to offer and how it can enhance their financial experiences.

Contract Explanation:

The transacaoParcelada smart contract was developed to facilitate installment transactions with collateral in Ethereum (ETH). It uses a Chainlink oracle to obtain the price of the underlying asset, allowing transactions to be adjusted based on real-time price fluctuations. The contract's main objective is to enable installment transactions with collateral in ETH. It is designed to allow users to create transactions divided into multiple installments, guaranteeing payment through assets deposited as collateral. The contract includes a data structure to store information about transactions, such as identifier, asset value, number of installments, value of each installment, total transaction value, sender address, and completion status. There are functions that allow users to create new installment transactions, execute transaction installments, automate transaction execution, and manage deposited collateral. The contract uses the Chainlink AggregatorV3Interface interface to obtain the price of the underlying asset in real-time, ensuring transaction accuracy.

Benefit for Buyer and Creditor:

By adopting this solution, buyers can enjoy several significant advantages. Firstly, by parceling their purchases, they have the opportunity to keep their funds available for a longer period in their accounts, providing greater financial flexibility and enhancing their purchasing power. Additionally, by guaranteeing transactions with collateral, the risk of default is significantly reduced, providing greater security for both the buyer and the credit provider. Credit providers also reap substantial benefits from this transaction modality. By providing financial support for installment transactions, they have the opportunity to generate returns through interest rates stipulated in the smart contract. This not only expands their investment opportunities but also diversifies their asset portfolio, adding value and solidity to their portfolio. In summary, both the buyer and the creditor benefit from the installment transactions with collateral system in a mathematically measurable way. The buyer saves on opportunity costs by parceling the payment, while the creditor receives interest rates on the invested capital and minimizes the risk of default through collateral.

Contract addresses: 
Scroll: 0xb629b5679Afd010F4778eac7B69194d0887B2c90
Aurora: 0x936b1Ac167c89731B20584D4722f1B3dbEc37651
