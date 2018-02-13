module Explorer.I18n.JP where

import Explorer.I18n.Types (Translation)

translation :: Translation
translation =
    { common:
        { cBack: "戻る"
        , cApi: "API"
        , cADA: "ADA"
        , cBCshort: "BC"
        , cBCong: "Bitcoin"
        , cTransaction: "トランザクション"
        , cTransactions: "トランザクション"
        , cTransactionFeed: "トランザクションフィード"
        , cAddress: "アドレス"
        , cAddresses: "アドレス"
        , cVersion: "バージョン"
        , cCalculator: "計算機"
        , cNetwork: "ネットワーク"
        , cSummary: "概要"
        , cBlock: "スロット"
        , cGenesis: "ジェネシス・ブロック"
        , cHash: "ハッシュ値"
        , cHashes: "ハッシュ値"
        , cEpoch: "エポック"
        , cEpochs: "エポック"
        , cSlot: "スロット"
        , cSlots: "スロット"
        , cAge: "経過時間"
        , cTotalSent: "総送信額"
        , cBlockLead: "スロットリーダー"
        , cSize: "サイズ (bytes)"
        , cExpand: "開く"
        , cCollapse: "閉じる"
        , cNoData: "データなし"
        , cTitle: "Cardano Blockchain Explorer"
        , cCopyright: "Cardano Blockchain Explorer @2017"
        , cUnknown: "不明"
        , cTotalOutput: "合計アウトプット"
        , cOf: "of"
        , cNotAvailable: "データがありません"
        , cLoading: "ロード中..."
        , cBack2Dashboard: "ダッシュボードに戻る"
        , cYes: "はい"
        , cNo: "いいえ"
        , cDays: "日"
        , cHours: "時間"
        , cMinutes: "分"
        , cSeconds: "秒"
        , cDateFormat: "YYYY/MM/DD HH:mm:ss"
        , cDecimalSeparator: "."
        , cGroupSeparator: ","
        }
    , navigation:
        { navHome: "ホーム"
        , navBlockchain: "ブロックチェーン"
        , navMarket: "マーケット"
        , navCharts: "チャート"
        , navTools: "ツール"
        }
    , hero:
        {  hrSubtitle: "カルダノネットワーク上のアドレス、トランザクション、エポック、スロットを検索"
        , hrSearch: "スロット、エポック、トランザクションを検索"
        , hrTime: "タイム"
        }
    , dashboard:
        { dbTitle: "ダッシュボード"
        , dbLastBlocks: "最近のスロット"
        , dbLastBlocksDescription: "{0}に{1}のトランザクションが生成されました"
        , dbPriceAverage: "平均価格"
        , dbPriceForOne: "1{1}の価格: {0}"
        , dbPriceSince: "昨日からの価格: {0}"
        , dbTotalSupply: "総供給額"
        , dbTotalAmountOf: "システム内総額: {0}"
        , dbTotalAmountOfTransactions: "開設以来システム内で検出された総トランザクション数"
        , dbExploreBlocks: "スロットを検索する"
        , dbExploreTransactions: "トランザクションを検索する"
        , dbBlockchainOffer: "ブロックチェーンエクスプローラーから提供されるもの"
        , dbBlockSearch: "スロット検索"
        , dbBlockSearchDescription: "スロットはトランザクションを格納しているボックスです。"
        , dbAddressSearch: "アドレス検索"
        , dbAddressSearchDescription: "アドレスを検索します"
        , dbTransactionSearch: "トランザクション検索"
        , dbTransactionSearchDescription: "トランザクションはAからBへコインを送金することです。"
        , dbApiDescription: "我々の安全なAPIは、さまざまな言語とSDKで利用可能です。"
        , dbGetAddress: "アドレス取得"
        , dbResponse: "レスポンス"
        , dbCurl: "Curl"
        , dbNode: "Node"
        , dbJQuery: "jQuery"
        , dbGetApiKey: "APIキー取得"
        , dbMoreExamples: "その他の例を見る"
        , dbAboutBlockchain: "ブロックチェーンについて"
        , dbAboutBlockchainDescription: "ブロックチェーンAPIはより容易に暗号通貨のアプリケーション及び機能を実装することができます。我々は開発者が高速、スケーラブル、かつ安全なサービスを構築できるようなプラットフォームを提供することに注力しています。<br/><br/>このAPIはベータ版では無料で無制限です。APIはまだ初期段階であり、今後より多くのエンドポイント、機能の導入を予定しています。開発チームはユーザーが求めているAPIを構築したいので、リクエスト、改善点などがあればご連絡お願いします。"
        }
    , address:
        { addScan: "QRコードをスキャンしてアドレスをクリップボードにコピーする"
        , addQrCode: "QRコード"
        , addFinalBalance: "最終残高"
        , addNotFound: "アドレスは存在しません"
        }
    , tx:
        { txTime: "入金時刻"
        , txIncluded: "含まれている"
        , txRelayed: "中継IP"
        , txEmpty: "トランザクションなし"
        , txFees: "トランザクション料"
        , txNotFound: "トランザクションは見つかりません"
        }
    , block:
        { blFees: "手数料"
        , blEstVolume: "推定容量"
        , blPrevBlock: "前のスロット"
        , blNextBlock: "次のスロット"
        , blRoot: "ハッシュ根"
        , blEpochSlotNotFound: "エポック / スロットは存在していません。"
        , blSlotNotFound: "スロットは存在していません。"
        }
    , genesisBlock:
        { gblNotFound: "ジェネシス・ブロックは見つかりませんでした"
        , gblNumberRedeemedAddresses: "還元済みアドレス"
        , gblNumberNotRedeemedAddresses: "還元可能なアドレス数"
        , gblNumberAddressesToRedeem: "還元アドレス数"
        , gblRedeemedAmountTotal: "還元済み"
        , gblNonRedeemedAmountTotal: "未還元数"
        , gblFilterAll: "全て"
        , gblFilterRedeemed: "還元済み"
        , gblFilterNonRedeemed: "未還元"
        , gblAddressesNotFound: "そのアドレスは存在しません"
        , gblAddressesError: "アドレス読み込み中にエラーが発生しました."
        , gblAddressRedeemAmount: "還元される額"
        , gblAddressIsRedeemed: "還元済み"
        }
    , footer:
        { fooIohkSupportP: "IOHK supported project"
        , fooGithub: "Github"
        , fooEmail: "Email"
        , fooTwitter: "Twitter"
        , fooDaedalusPlatform: "ダイダロスプラットフォーム"
        , fooWhyCardano: "なぜカルダノなのか"
        , fooCardanoRoadmap: "カルダノロードマップ"
        , fooCardanoSource: "カルダノSLソース"
        , fooCardanoFoundation: "カルダノ財団"
        , fooCardanoFoundationYoutube: "カルダノ財団 Youtube"
        , fooCardanoFoundationTwitter: "カルダノ財団 Twitter"
        , fooCardanoHub: "カルダノハブ"
        , fooCardanoLaunch: "カルダノローンチ"
        , fooCardanoSlack: "カルダノ財団 Slack"
        , fooCardanoReddit: "カルダノ財団 Reddit"
        , fooCardanoCommunity: "カルダノコミュニティー"
        , fooCardanoDocumentation: "カルダノドキュメンテーション"
        , fooCardanoTestnet: "カルダノテストネット"
        , fooCardanoOpenSource: "カルダノはオープンソースプロジェクトです"
        , fooIOHK: "IOHK"
        , fooIOHKBlog: "IOHKブログ"
        , fooIOHKYoutube: "IOHK YouTube"
        , fooDisclaimerPt1: "カルダノは、ソフトウェアプラットフォームのみであり、ブロックチェーン資産、デジタル通貨、暗号通貨またはそれに関連する各資金の精査や実質的なレビューは一切行いません。あなたは自身の投資評価、ブロックチェーン資産を交換するかどうかの決定、ブロックチェーン資産をカルダノと交換の如何に関して、完全かつ唯一の責任があります。多くの場合、あなたの調査に基づいて交換するブロックチェーン資産は価値が上がらず、下がる可能性があります。同様に、調査を基に交換するブロックチェーン資産は、交換後に価値が上がる可能性もあります。"
        , fooDisclaimerPt2: "過去の業績は必ずしも将来の結果を 暗 示す るものではありません。ブロックチェーン資産への投資には、投資の一部または全てが失われるリスクが伴います。換金するブロックチェーン資産の価値は、市場リスクおよびその他の投資リスクの対象となります。"
        , fooProject: "プロジェクト"
        , fooProtocol: "プロトコル"
        , fooFoundation: "財団"
        , fooLearnMore: "詳しく知る"
        }
    , notfound:
        { nfTitle: "404"
        , nfDescription: "ページが見つかりません"
        }
    }