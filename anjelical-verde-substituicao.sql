-- Atualização do pacote verde substituído pelo novo -1ºpass-ANJELICAL.3105
-- Mantém anjelical-skins intacto.
-- MFP publicado: GBOXVIPTEXTURAR.mfp
-- UUID interno novo: ECC6E545-B3F3-4CFA-B39C-8553ECD0D26A
-- SHA-256 do MFP: 4b53a0673e4586c6ad901183249ed819e58fbcb86f854655dc989270226fe017
-- Tamanho: 2556244 bytes

START TRANSACTION;

-- Migra o slug anterior, se ele foi cadastrado pela versão anterior.
UPDATE patches
SET slug = 'anjelical-verde'
WHERE slug = 'anjelical-verde-v1';

UPDATE patches
SET slug = 'anjelical-verde'
WHERE slug = 'anjelical-vermelha'
  AND NOT EXISTS (SELECT 1 FROM patches WHERE slug = 'anjelical-verde');

-- Atualiza o registro da função verde.
UPDATE patches
SET
    name = 'ANJELICAL VERDE',
    category = 'free-fire-normal',
    dylib_name = 'GBOXVIPTEXTURAR.mfp',
    description = 'Textura ANJELICAL VERDE atualizada pelo novo pacote enviado.',
    status = 1,
    version = '2.0.0',
    download_url = 'https://filza.gboxiosvip.com.br/resources/GBOXVIPTEXTURAR.mfp',
    sha256 = '4b53a0673e4586c6ad901183249ed819e58fbcb86f854655dc989270226fe017',
    size = 2556244,
    package_id = 'ECC6E545-B3F3-4CFA-B39C-8553ECD0D26A',
    updated_at = NOW()
WHERE slug = 'anjelical-verde';

-- Se ainda não existir, cadastra a função verde.
INSERT INTO patches
    (name, slug, category, dylib_name, description, status, version,
     download_url, sha256, size, package_id, created_at, updated_at)
SELECT
    'ANJELICAL VERDE',
    'anjelical-verde',
    'free-fire-normal',
    'GBOXVIPTEXTURAR.mfp',
    'Textura ANJELICAL VERDE atualizada pelo novo pacote enviado.',
    1,
    '2.0.0',
    'https://filza.gboxiosvip.com.br/resources/GBOXVIPTEXTURAR.mfp',
    '4b53a0673e4586c6ad901183249ed819e58fbcb86f854655dc989270226fe017',
    2556244,
    'ECC6E545-B3F3-4CFA-B39C-8553ECD0D26A',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM patches WHERE slug = 'anjelical-verde');

COMMIT;

-- Desativar somente a textura verde:
-- UPDATE patches SET status = 0, updated_at = NOW() WHERE slug = 'anjelical-verde';

-- Ativar novamente:
-- UPDATE patches SET status = 1, updated_at = NOW() WHERE slug = 'anjelical-verde';

-- Conferência, incluindo a textura original:
SELECT id, name, slug, status, version, dylib_name,
       download_url, sha256, size, package_id
FROM patches
WHERE slug IN ('textura-pantera', 'anjelical-skins', 'anjelical-verde')
ORDER BY slug;
