// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

// Precisamos de algumas funcoes utilitarias.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";


contract MyEpicNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // Aqui esta o codigo do nosso SVG. So precisaremos alterar as palavras que vao ser exibidas. Todo o resto permanece igual.
  // Entao, fazemos uma variavel baseSvg aqui que todos os nossos NFTs vao usar.
  string baseSvg = "<svg  xmlns='http://www.w3.org/2000/svg'  preserveAspectRatio='xMinYMin meet'  viewBox='0 0 350 350'>  <defs>    <linearGradient id='Gradient1'>      <stop class='stop1' offset='0%'/>      <stop class='stop2' offset='50%'/>      <stop class='stop3' offset='100%'/>    </linearGradient>  </defs>  <style>    .base {      fill: blue;      font-family: serif;      font-size: 20px;      color: #FFF;    }    .stop1 { stop-color: green; }    .stop2 { stop-color: white; stop-opacity: 0; }    .stop3 { stop-color: yellow; }      </style>  <rect width='100%' height='100%' fill='url(#Gradient1)' />  <text    x='50%'    y='50%'    class='base'    dominant-baseline='middle'    text-anchor='middle'  >";

  // Eu crio tres listas, cada uma com seu grupo de palavras aleatorias
  // escolha as suas palavras divertidas, nome de personagem, comida, time de futebol, o que quiser! 
  string[] firstWords = ["Natal", "Navegantes", "Nazare", "Niteroi", "Normandia", "Nilo", "Nordestina", "Natuba", "Nepomuceno", "Nuporanga", "Novorizonte"];
  string[] secondWords = ["Tigre", "Tubarao", "Tartaruga", "Touro", "Tatu", "Tucano", "Tamandua", "Toupeira", "Truta", "Tainha", "Texugo", "Tatu"];
  string[] thirdWords = ["Tabule", "Tacos", "Tamarillo", "Tangerina", "Tapioca", "Tiramisu", "Tortilla", "Tutu", "Torta", "Trufa" "Tomate", "Torrada"];

  constructor() ERC721 ("ChavesNFT", "CHAVO") {
    console.log("Meu contrato de NFT! Tchu-hu");
  }

  // Crio uma funcao que pega uma palavra aleatoria da lista.
  function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
    // Crio a 'semente' para o gerador aleatorio. Mais sobre isso na licao. 
    uint256 rand = random(string(abi.encodePacked("PRIMEIRA_PALAVRA", Strings.toString(tokenId))));
    // pego o numero no maximo ate o tamanho da lista, para nao dar erro de indice.
    rand = rand % firstWords.length;
    return firstWords[rand];
  }

  function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("SEGUNDA_PALAVRA", Strings.toString(tokenId))));
    rand = rand % secondWords.length;
    return secondWords[rand];
  }

  function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("TERCEIRA_PALAVRA", Strings.toString(tokenId))));
    rand = rand % thirdWords.length;
    return thirdWords[rand];
  }

  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();

    // Agora pegamos uma palavra aleatoria de cada uma das 3 listas.
    string memory first = pickRandomFirstWord(newItemId);
    string memory second = pickRandomSecondWord(newItemId);
    string memory third = pickRandomThirdWord(newItemId);

    // Concateno tudo junto e fecho as tags <text> e <svg>.
    string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));
    console.log("\n--------------------");
    console.log(finalSvg);
    console.log("--------------------\n");

    _safeMint(msg.sender, newItemId);
  
    // Vamos definir essa tokenURI depois!
    _setTokenURI(newItemId, "blah");
  
    _tokenIds.increment();
    console.log("Um NFT com ID %s foi cunhado para %s", newItemId, msg.sender);
  }
}