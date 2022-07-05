// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;
// Primeiro importamos alguns contratos do OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// Nós herdamos o contrato que importamos. Isso significa que
// teremos acesso aos métodos do contrato herdado.
contract MyEpicNFT is ERC721URIStorage {
    // Mágica dada pelo OpenZeppelin para nos ajudar a observar os tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Nós precisamos passar o nome do nosso token NFT e o símbolo dele.
    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("Esse eh meu contrato de NFT! Tchu-hu");
    }

    // Uma função que o nosso usuário irá chamar para pegar sua NFT.
    function makeAnEpicNFT() public {
        // Pega o tokenId atual, que começa por 0.
        uint256 newItemId = _tokenIds.current();
        // Minta ("cunha") o NFT para o sender (quem ativa o contrato) usando msg.sender.
        _safeMint(msg.sender, newItemId);
        // Designa os dados do NFT.
        _setTokenURI(newItemId, "data:application/json;base64,ewogICJuYW1lIjogIk5hamFGcmFwcGVUb21pbGhvIiwKICAiZGVzY3JpcHRpb24iOiAiVW0gTkZUIHN1cGVyIGZhbW9zbyBkZSB1bWEgY29sZcOnw6NvIGRlIEFuaW1haXMsIEFsaW1lbnRvcyBlIFBsYW50YXMiLAogICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJad29nSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUlLSUNCd2NtVnpaWEoyWlVGemNHVmpkRkpoZEdsdlBTSjRUV2x1V1UxcGJpQnRaV1YwSWdvZ0lIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJZ28rQ2lBZ1BHUmxabk0rQ2lBZ0lDQThiR2x1WldGeVIzSmhaR2xsYm5RZ2FXUTlJa2R5WVdScFpXNTBNU0krQ2lBZ0lDQWdJRHh6ZEc5d0lHTnNZWE56UFNKemRHOXdNU0lnYjJabWMyVjBQU0l3SlNJdlBnb2dJQ0FnSUNBOGMzUnZjQ0JqYkdGemN6MGljM1J2Y0RJaUlHOW1abk5sZEQwaU5UQWxJaTgrQ2lBZ0lDQWdJRHh6ZEc5d0lHTnNZWE56UFNKemRHOXdNeUlnYjJabWMyVjBQU0l4TURBbElpOCtDaUFnSUNBOEwyeHBibVZoY2tkeVlXUnBaVzUwUGdvZ0lEd3ZaR1ZtY3o0S0lDQThjM1I1YkdVK0NpQWdJQ0F1WW1GelpTQjdDaUFnSUNBZ0lHWnBiR3c2SUdKc2RXVTdDaUFnSUNBZ0lHWnZiblF0Wm1GdGFXeDVPaUJ6WlhKcFpqc0tJQ0FnSUNBZ1ptOXVkQzF6YVhwbE9pQXlNSEI0T3dvZ0lDQWdJQ0JqYjJ4dmNqb2dJMFpHUmpzS0lDQWdJSDBLSUNBZ0lDNXpkRzl3TVNCN0lITjBiM0F0WTI5c2IzSTZJR2R5WldWdU95QjlDaUFnSUNBdWMzUnZjRElnZXlCemRHOXdMV052Ykc5eU9pQjNhR2wwWlRzZ2MzUnZjQzF2Y0dGamFYUjVPaUF3T3lCOUNpQWdJQ0F1YzNSdmNETWdleUJ6ZEc5d0xXTnZiRzl5T2lCNVpXeHNiM2M3SUgwS0lDQWdJQW9nSUR3dmMzUjViR1UrQ2lBZ1BISmxZM1FnZDJsa2RHZzlJakV3TUNVaUlHaGxhV2RvZEQwaU1UQXdKU0lnWm1sc2JEMGlkWEpzS0NOSGNtRmthV1Z1ZERFcElpQXZQZ29nSUR4MFpYaDBDaUFnSUNCNFBTSTFNQ1VpQ2lBZ0lDQjVQU0kxTUNVaUNpQWdJQ0JqYkdGemN6MGlZbUZ6WlNJS0lDQWdJR1J2YldsdVlXNTBMV0poYzJWc2FXNWxQU0p0YVdSa2JHVWlDaUFnSUNCMFpYaDBMV0Z1WTJodmNqMGliV2xrWkd4bElnb2dJRDRLSUNBZ0lDQWdUbUZxWVVaeVlYQndaVlJ2Yldsc2FHOEtJQ0E4TDNSbGVIUStDand2YzNablBnPT0iCn0=");
        // Incrementa o contador para quando o próximo NFT for mintado.
        _tokenIds.increment();
    }
}
