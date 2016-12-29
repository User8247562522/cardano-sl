{-# LANGUAGE ScopedTypeVariables #-}
-- | Pos.Crypto specification

module Test.Pos.CryptoSpec
       ( spec
       ) where

import qualified Data.ByteString       as BS
import           Formatting            (build, sformat)
import           Test.Hspec            (Expectation, Spec, describe, shouldBe, specify)
import           Test.Hspec.QuickCheck (prop)
import           Test.QuickCheck       (Property, (===), (==>))
import           Universum

import           Pos.Binary            (Bi)
import           Pos.Crypto            (EncShare, Hash, KeyPair (..), ProxyCert,
                                        ProxySecretKey (..), ProxySignature, PublicKey,
                                        Secret, SecretKey, SecretProof,
                                        SecretSharingExtra, Share, Signature, Signed,
                                        VssPublicKey, checkProxySecretKey, checkSig,
                                        createProxySecretKey, deterministic,
                                        fullPublicKeyF, hash, parseFullPublicKey,
                                        proxySign, proxyVerify, randomNumber, sign,
                                        toPublic)
import           Pos.Ssc.GodTossing    ()
import           Pos.Util              (AsBinary)

import           Test.Pos.Util         (binaryEncodeDecode, safeCopyEncodeDecode,
                                        serDeserId)

spec :: Spec
spec = describe "Crypto" $ do
    describe "Random" $ do
        -- Let's protect ourselves against *accidental* random gen changes
        -- (e.g. if binary or cryptonite or some other package decide to
        -- behave differently in a new version)
        describe "random number determinism" $ do
            let seed = BS.pack [1..40]
            specify "[0,1)" $
                deterministic seed (randomNumber 1) `shouldBe` 0
            -- specify "[0,2)" $
            --     deterministic seed (randomNumber 2) `shouldBe` 1
            -- specify "[0,1000)" $
            --     deterministic seed (randomNumber 1000) `shouldBe` 327

    describe "Hashing" $ do
        describe "Hash instances" $ do
            prop
                "Bi"
                (binaryEncodeDecode @(Hash Int))
            prop
                "SafeCopy"
                (safeCopyEncodeDecode @(Hash Int))
        describe "hashes of different values are different" $ do
            prop
                "Bool"
                (hashInequality @Bool)
            prop
                "[()]"
                (hashInequality @[()])
            prop
                "[[Maybe Integer]]"
                (hashInequality @[[Maybe Integer]])
        -- Let's protect ourselves against *accidental* hash changes
        describe "check hash sample" $ do
            specify "1 :: Int" $
                checkHash (1 :: Int)
                    -- "009d179ba955ae9b0690b8f6a96a866972b1606d97b0c9d8094073a374de77b7612d4ae35ac3e38f4092aced0f1680295a0bc95722ad039253ee6aa275569848" -- Blake2b_512
                    "c43b29d95a3585cb5264b3223d70e853f899a82e01cb3e62b0bdd871" -- Blake2s_224

    describe "Signing" $ do
        describe "Identity testing" $ do
            describe "Bi instances" $ do
                prop "Hash"                     (binaryEncodeDecode @(Hash Int))
                prop "SecretKey"                (binaryEncodeDecode @SecretKey)
                prop "PublicKey"                (binaryEncodeDecode @PublicKey)
                prop "Signature"                (binaryEncodeDecode @(Signature ()))
                prop "ProxyCert"                (binaryEncodeDecode @(ProxyCert Int))
                prop "ProxySecretKey"           (binaryEncodeDecode @(ProxySecretKey Int))
                prop "ProxySignature"
                    (binaryEncodeDecode @(ProxySignature Int Int))
                prop "Signed"                   (binaryEncodeDecode @(Signed Bool))
                prop "VssPublicKey"             (binaryEncodeDecode @VssPublicKey)
                prop "AsBinary VssPublicKey"
                    (binaryEncodeDecode @(AsBinary VssPublicKey))
                prop "AsBinary Secret"
                    (binaryEncodeDecode @(AsBinary Secret))
                prop "AsBinary Share"
                    (binaryEncodeDecode @(AsBinary Share))
                prop "AsBinary EncShare"
                    (binaryEncodeDecode @(AsBinary EncShare))
                prop "AsBinary SecretProof"
                    (binaryEncodeDecode @(AsBinary SecretProof))
                prop "AsBinary SecretSharingExtra"
                    (binaryEncodeDecode @(AsBinary SecretSharingExtra))
            describe "SafeCopy instances" $ do
                prop "Hash"           (safeCopyEncodeDecode @(Hash Int))
                prop "SecretKey"      (safeCopyEncodeDecode @SecretKey)
                prop "PublicKey"      (safeCopyEncodeDecode @PublicKey)
                prop "Signature"      (safeCopyEncodeDecode @(Signature ()))
                prop "Signed"         (safeCopyEncodeDecode @(Signed ()))
                prop "ProxyCert"      (safeCopyEncodeDecode @(ProxyCert Int))
                prop "ProxySecretKey" (safeCopyEncodeDecode @(ProxySecretKey Int))
                prop "ProxySignature"
                    (safeCopyEncodeDecode @(ProxySignature Int Int))
                prop "Signed"         (safeCopyEncodeDecode @(Signed Bool))
                prop "AsBinary VssPublicKey"
                    (safeCopyEncodeDecode @(AsBinary VssPublicKey))
                prop "AsBinary Secret"
                    (safeCopyEncodeDecode @(AsBinary Secret))
                prop "AsBinary Share"
                    (safeCopyEncodeDecode @(AsBinary Share))
                prop "AsBinary EncShare"
                    (safeCopyEncodeDecode @(AsBinary EncShare))
                prop "AsBinary SecretProof"
                    (safeCopyEncodeDecode @(AsBinary SecretProof))
                prop "AsBinary SecretSharingExtra"
                    (safeCopyEncodeDecode @(AsBinary SecretSharingExtra))
        describe "AsBinaryClass" $ do
            prop "VssPublicKey <-> AsBinary VssPublicKey"
                (serDeserId @VssPublicKey)
            prop "Secret <-> AsBinary Secret"
                (serDeserId @Secret)
            prop "Share <-> AsBinary Share"
                (serDeserId @Share)
            prop "EncShare <-> AsBinary EncShare"
                (serDeserId @EncShare)
            prop "SecretProof <-> AsBinary SecretProof"
                (serDeserId @SecretProof)
            prop "SecretSharingExtra <-> AsBinary SecretSharingExtra"
                (serDeserId @SecretSharingExtra)
        describe "keys" $ do
            prop
                "derived pubkey equals to generated pubkey"
                keyDerivation
            prop
                "formatted key can be parsed back"
                keyParsing
        describe "signing" $ do
            prop
                "signed data can be verified successfully"
                (signThenVerify @[Int])
            prop
                "signed data can't be verified by a different key"
                (signThenVerifyDifferentKey @[Int])
            prop
                "modified data signature can't be verified"
                (signThenVerifyDifferentData @[Int])
        describe "proxy delegate signing" $ do
            prop
                "signature can be verified successfully"
                (proxySignVerify @[Int] @(Int,Int))
            prop
                "signature can't be verified with a different key"
                (proxySignVerifyDifferentKey @[Int] @(Int,Int))
            prop
                "modified data signature can't be verified "
                (proxySignVerifyDifferentData @[Int] @(Int,Int))
            prop
                "correct proxy signature schemes pass correctness check"
                (proxySecretKeyCheckCorrect @(Int,Int))
            prop
                "incorrect proxy signature schemes fails correctness check"
                (proxySecretKeyCheckIncorrect @(Int,Int))



hashInequality :: (Eq a, Bi a) => a -> a -> Property
hashInequality a b = a /= b ==> hash a /= hash b

checkHash :: Bi a => a -> Text -> Expectation
checkHash x s = sformat build (hash x) `shouldBe` s

keyDerivation :: KeyPair -> Property
keyDerivation kp = getPub kp === toPublic (getSec kp)

keyParsing :: PublicKey -> Property
keyParsing pk = parseFullPublicKey (sformat fullPublicKeyF pk) === Just pk

signThenVerify
    :: Bi a
    => SecretKey -> a -> Bool
signThenVerify sk a = checkSig (toPublic sk) a $ sign sk a

signThenVerifyDifferentKey
    :: Bi a
    => SecretKey -> PublicKey -> a -> Property
signThenVerifyDifferentKey sk1 pk2 a =
    (toPublic sk1 /= pk2) ==> not (checkSig pk2 a $ sign sk1 a)

signThenVerifyDifferentData
    :: (Eq a, Bi a)
    => SecretKey -> a -> a -> Property
signThenVerifyDifferentData sk a b =
    (a /= b) ==> not (checkSig (toPublic sk) b $ sign sk a)

proxySignVerify :: (Bi a, Bi w, Eq w) => SecretKey -> SecretKey -> w -> a -> Bool
proxySignVerify issuerSk delegateSk w m =
    proxyVerify issuerPk signature (== w) m
  where
    issuerPk = toPublic issuerSk
    proxySk = createProxySecretKey issuerSk (toPublic delegateSk) w
    signature = proxySign delegateSk proxySk m

proxySignVerifyDifferentKey
    :: (Bi a, Bi w, Eq w)
    => SecretKey -> SecretKey -> PublicKey -> w -> a -> Property
proxySignVerifyDifferentKey issuerSk delegateSk pk2 w m =
    (toPublic issuerSk /= pk2) ==> not (proxyVerify pk2 signature (== w) m)
  where
    proxySk = createProxySecretKey issuerSk (toPublic delegateSk) w
    signature = proxySign delegateSk proxySk m

proxySignVerifyDifferentData
    :: (Bi a, Eq a, Bi w, Eq w)
    => SecretKey -> SecretKey -> w -> a -> a -> Property
proxySignVerifyDifferentData issuerSk delegateSk w m m2 =
    (m /= m2) ==> not (proxyVerify issuerPk signature (== w) m2)
  where
    issuerPk = toPublic issuerSk
    proxySk = createProxySecretKey issuerSk (toPublic delegateSk) w
    signature = proxySign delegateSk proxySk m

proxySecretKeyCheckCorrect
    :: (Bi w) => SecretKey -> SecretKey -> w -> Bool
proxySecretKeyCheckCorrect issuerSk delegateSk w =
    checkProxySecretKey delegateSk proxySk
  where
    proxySk = createProxySecretKey issuerSk (toPublic delegateSk) w

proxySecretKeyCheckIncorrect
    :: (Bi w) => SecretKey -> SecretKey -> PublicKey -> w -> Property
proxySecretKeyCheckIncorrect issuerSk delegateSk pk2 w = do
    let ProxySecretKey{..} =
            createProxySecretKey issuerSk (toPublic delegateSk) w
        wrongPsk = ProxySecretKey { pskIssuerPk = pk2, ..}
    (toPublic issuerSk /= pk2) ==> not (checkProxySecretKey delegateSk wrongPsk)
