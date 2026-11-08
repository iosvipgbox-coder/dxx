# Build status — GBOXIOSVIP 2.1 build 2

Esta Source foi adaptada para a IPA de referência `3105-2.1-beta2-no-key-ui-unsigned.ipa`.

## Identidade aplicada

- Nome exibido: `GBOXIOSVIP`
- Executável: `3105`
- Bundle ID: `com.apple.mobile.MobileHouseArrest`
- Marketing version: `2.1`
- Build: `2`
- Deployment target: iOS 16.0
- Arquiteturas: arm64

## Autenticação por IP

- A tela de login e a consulta à API estão temporariamente desativadas; o app abre diretamente na tela principal.
- O código de validação por IP permanece no projeto, mas não é acionado enquanto a tela de login estiver desativada.
- O fluxo não solicita nem transmite key de licença ou HWID.

## Patches incluídos

A pasta `ThreeOneOSFive/Resources/OfficialPatches` contém nove pacotes protegidos, incluindo `ANJELICAL_SKINS.mfp` (original) e `GBOXVIPTEXTURAR.mfp` (ANJELICAL VERDE, substituído pelo novo arquivo enviado).

## CodeMagic

O workflow `ios-unsigned` gera `build/ipa/GBOXIOSVIP.ipa` sem assinatura, confere a presença dos nove pacotes `.mfp` e rejeita arquivos `.3105` desprotegidos. Para instalar em dispositivo, use os certificados/provisioning profiles da sua conta Apple em uma etapa de assinatura compatível. Nenhuma chave ou segredo foi incluído.

## Texturas verdes e controle pela API

`GBOXVIPTEXTURAR.mfp` usa o slug `anjelical-verde`, o UUID `ECC6E545-B3F3-4CFA-B39C-8553ECD0D26A` e o nome `ANJELICAL VERDE`. O arquivo novo substitui o binário verde anterior; `anjelical-skins` continua sendo a função original separada.

O cartão do YouTube `https://www.youtube.com/@gboxiosvip` aparece abaixo do canal do WhatsApp. Os botões de exportação/compartilhamento do arquivo foram removidos da interface do cliente.

## Entrada visual do patch adicional

A entrada `HS PESCOÇO - ALTO SEM ANTENA` foi adicionada ao catálogo visual de `ContentView.swift`. Ela usa o UUID `8E5AC052-6D15-4D54-A97D-CDAD6CDD900D`, é classificada como patch HS e obedece ao mesmo slug remoto dos demais patches: `status = 1` mostra a linha e `status = 0` oculta a linha.

## Sincronização remota

O catálogo remoto agora aceita `status`, `version`, `download_url` ou `url`, `sha256`, `size` e `package_id`. As versões válidas são exibidas na linha visual como `v1.0`, `v1.1` ou `v1.2`, conforme o valor publicado pela API. Pacotes ativos com URL HTTPS autorizada são baixados em background, conferidos por tamanho, SHA-256 e UUID, validados pelo `PatchPackageCodec` e instalados atomically sem substituir um patch ativo.

Quando `download_url` estiver vazio, o app tenta o fallback HTTPS `/resources/<dylib_name>`, permitindo publicar, por exemplo, `PESCOCO-VIP.mfp` no diretório de recursos. Nomes longos no painel são exibidos em até duas linhas, com fonte reduzida e sem truncamento em uma única linha.

## Layout dos patches

As linhas de patch não renderizam ícone, checkbox ou quadrado lateral. O único controle visual à direita é o switch; o status permanece abaixo do nome.
