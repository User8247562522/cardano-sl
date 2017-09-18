module Explorer.I18n.EN where

import Explorer.I18n.Types (Translation)

translation :: Translation
translation =
    { common:
        { cBack: "Back"
        , cApi: "Api"
        , cADA: "ADA"
        , cBCshort: "BC"
        , cBCong: "Bitcoin"
        , cTransaction: "Transaction"
        , cTransactions: "Transactions"
        , cTransactionFeed: "Transactions Feed"
        , cAddress: "Address"
        , cAddresses: "Addresses"
        , cVersion: "version"
        , cCalculator: "Calculator"
        , cNetwork: "Network"
        , cSummary: "Summary"
        , cBlock: "Slot"
        , cGenesis: "Genesis block"
        , cHash: "Hash"
        , cHashes: "Hashes"
        , cEpoch: "Epoch"
        , cEpochs: "Epochs"
        , cSlot: "Slot"
        , cSlots: "Slots"
        , cAge: "Since"
        , cTotalSent: "Total Sent"
        , cBlockLead: "Slot leader"
        , cSize: "Size (bytes)"
        , cExpand: "Expand"
        , cCollapse: "Collapse"
        , cNoData: "No data"
        , cTitle: "Cardano Blockchain Explorer"
        , cCopyright: "Cardano Blockchain Explorer @2017"
        , cUnknown: "Unknown"
        , cTotalOutput: "Total Output"
        , cOf: "of"
        , cNotAvailable: "not available"
        , cLoading: "Loading..."
        , cBack2Dashboard: "Back to Dashboard"
        , cYes: "yes"
        , cNo: "no"
        , cDays: "days"
        , cHours: "hours"
        , cMinutes: "minutes"
        , cSeconds: "seconds"
        , cDateFormat: "MM/DD/YYYY HH:mm:ss"
        , cDecimalSeparator: "."
        , cGroupSeparator: ","
        }
    , navigation:
        { navHome: "Home"
        , navBlockchain: "Blockchain"
        , navMarket: "Market"
        , navCharts: "Charts"
        , navTools: "Tools"
        }
    , hero:
        { hrSubtitle: "Search addresses, transactions, epochs & slots on the Cardano network"
        , hrSearch: "Search for addresses, transactions, slots and epochs"
        , hrTime: "Time"
        }
    , dashboard:
        { dbTitle: "Dashboard"
        , dbLastBlocks: "Last slots"
        , dbLastBlocksDescription: "On {0} {1} transactions are generated"
        , dbPriceAverage: "Price (average)"
        , dbPriceForOne: "{0} for 1 {1}"
        , dbPriceSince: "{0} since yesterday."
        , dbTotalSupply: "Total supply"
        , dbTotalAmountOf: "Amount of {0} in the system."
        , dbTotalAmountOfTransactions: "Total amount of transactions detected in system since the beginning."
        , dbExploreBlocks: "Explore slots"
        , dbExploreTransactions: "Explore transactions"
        , dbBlockchainOffer: "What do we offer on our block explorer"
        , dbBlockSearch: "Slot search"
        , dbBlockSearchDescription: "Slot is a box where transactions are stored."
        , dbAddressSearch: "Address search"
        , dbAddressSearchDescription: "Address search"
        , dbTransactionSearch: "Transaction search"
        , dbTransactionSearchDescription: "Transaction is a transfer of coins from user 'A' to user 'B'."
        , dbApiDescription: "Our robust API is available in a variety of languages & SDKs."
        , dbGetAddress: "Get Address"
        , dbResponse: "Response"
        , dbCurl: "Curl"
        , dbNode: "Node"
        , dbJQuery: "jQuery"
        , dbGetApiKey: "Get API key"
        , dbMoreExamples: "See more examples"
        , dbAboutBlockchain: "About Blockchain"
        , dbAboutBlockchainDescription: "Blockchain API makes it easy yo build cryptocurrencies applications and features. We are focused on providing a platform that enables developers to create fast, scalable, secure services.<br/><br/>This API is free and unlimited while we are in beta. We are just getting started, and will be rolling out more endpoints and features in the coming weeks. We want to build the API you need, so please send us requests, suggestions, or just say hello."
        }
    , address:
        { addScan: "Scan this QR Code to copy address to clipboard"
        , addQrCode: "QR-Code"
        , addFinalBalance: "Final balance"
        , addNotFound: "Address does not exist."
        }
    , tx:
        { txTime: "Received time"
        , txIncluded: "Included in"
        , txRelayed: "Relayed by IP"
        , txEmpty: "No transactions"
        , txFees: "Transaction fee"
        , txNotFound: "Transaction does not exist."
        }
    , block:
        { blFees: "Fees"
        , blEstVolume: "Est. Volume"
        , blPrevBlock: "Previous slot"
        , blNextBlock: "Next slot"
        , blRoot: "Merkle root"
        , blEpochSlotNotFound: "Epoch / slot do not exist."
        , blSlotNotFound: "Slot does not exist."
        }
    , genesisBlock:
        { gblNotFound: "Genesis block not found."
        , gblNumberRedeemedAddresses: "Redeemed addresses"
        , gblAddressesNotFound: "Addresses do not exists."
        , gblAddressesError: "Error while trying to load addresses."
        , gblAddressRedeemAmount: "Redeemed amount"
        , gblAddressIsRedeemed: "Redeemed"
        }
    , footer:
        { fooIohkSupportP: "IOHK supported project"
        , fooGithub: "Github"
        , fooLinkedin: "Linkedin"
        , fooTwitter: "Twitter"
        , fooDaedalusPlatform: "Daedalus Platform"
        , fooWhyCardano: "Why Cardano"
        , fooCardanoRoadmap: "Cardano Roadmap"
        , fooCardanoSource: "Cardano Source"
        , fooCardanoFoundation: "Cardano Foundation"
        , fooCardanoFoundationYoutube: "Cardano Foundation YouTube"
        , fooCardanoFoundationTwitter: "Cardano Foundation Twitter"
        , fooCardanoHub: "Cardano Hub"
        , fooCardanoLaunch: "Cardano Launch"
        , fooCardanoSlack: "Cardano Slack"
        , fooCardanoReddit: "Cardano Reddit"
        , fooCardanoCommunity: "Cardano Community"
        , fooCardanoDocumentation: "Cardano Documentation"
        , fooCardanoTestnet: "Cardano Testnet"
        , fooCardanoOpenSource: "Cardano is an Open Source project."
        , fooIOHK: "IOHK"
        , fooIOHKBlog: "IOHK blog"
        , fooIOHKYoutube: "IOHK YouTube"
        , fooDisclaimerPt1: "Cardano is a software platform ONLY and does not conduct any independent diligence on or substantive review of any blockchain asset, digital currency, cryptocurrency or associated funds. You are fully and solely responsible for evaluating your investments, for determining whether you will exchange blockchain assets based on your own, and for all your decisions as to whether to exchange blockchain assets with Cardano. In many cases, blockchain assets you exchange on the basis of your research may not increase in value, and may decrease in value. Similarly, blockchain assets you exchange on the basis of your research may increase in value after your exchange."
        , fooDisclaimerPt2: "Past performance is not indicative of future results. Any investment in blockchain assets involves the risk of loss of part or all of your investment. The value of the blockchain assets you exchange is subject to market and other investment risks."
        }
    , notfound:
        { nfTitle: "404"
        , nfDescription: "Page not found"
        }
    }
