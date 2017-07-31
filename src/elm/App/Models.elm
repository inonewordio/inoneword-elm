module App.Models exposing (..)

import App.Routing as Routing
import App.Translations exposing (Language(Ukrainian))
import Categories.Models exposing (Category, CategoryWithEntries)
import Countries.Models exposing (..)
import Entries.Models exposing (Entry, FiltersConfig, LoadMoreState(EntriesNotAsked), filtersConfigInit)
import Entries.NewEntry.Models exposing (NewEntryModel, newEntryModelInit)
import Http
import Material
import Material.Snackbar as Snackbar
import ShareDialog.Models exposing (ShareDialog, initShareDialog)
import Users.Models exposing (User)
import Votes.Models exposing (..)
import Words.Models exposing (EmotionInfo, EntryVotedWords, Word)


type
    RemoteData e a
    -- = NotAsked
    = Loading
    | Failure e
    | Success a


type alias WebData a =
    RemoteData Http.Error a


type alias Flags =
    { localLanguage : Maybe String
    , localJWT : Maybe String
    }


type alias Model =
    { user : User
    , allEntries : WebData (List Entry)
    , categoriesWithEntries : WebData (List CategoryWithEntries)
    , popularEntries : WebData (List Entry)
    , similarEntries : WebData (List Entry)
    , entry : WebData Entry
    , entryPrefetched : Maybe Entry
    , entryWords : WebData (List Word)
    , entryTopWord : Maybe Word
    , entryVotes : WebData (List Vote)
    , entryVotesSlim : WebData (List VoteSlim)
    , entryVotedWords : WebData EntryVotedWords
    , entryVotedCountries : EntryVotedCountries
    , entryEmotionsInfo : Maybe (List EmotionInfo)
    , entryFilters : FiltersConfig
    , categories : WebData (List Category)
    , category : WebData Category
    , countries : WebData (List Country)
    , searchValue : String
    , wordSearchValue : String
    , newWordValue : String
    , searchDialogOpen : Bool
    , newWordFieldActive : Bool
    , loginFormTopBlockOpen : Bool
    , entryTabIndex : Int
    , route : Routing.Route
    , mdl : Material.Model
    , snackbar : Snackbar.Model Int
    , newEntry : NewEntryModel
    , shareDialog : ShareDialog
    , pageTitle : String
    , pageNumber : Int
    , loadMoreState : LoadMoreState
    , appLanguage : Language
    }


initialModel : Routing.Route -> User -> Language -> Model
initialModel route user language =
    { user = user
    , allEntries = Loading
    , categoriesWithEntries = Loading
    , popularEntries = Loading
    , similarEntries = Loading
    , entry = Loading
    , entryPrefetched = Nothing
    , entryWords = Loading
    , entryTopWord = Nothing
    , entryVotes = Loading
    , entryVotesSlim = Loading
    , entryVotedWords = Loading
    , entryVotedCountries = entryVotedCountriesInit
    , entryEmotionsInfo = Nothing
    , entryFilters = filtersConfigInit
    , categories = Loading
    , category = Loading
    , countries = Loading
    , searchValue = ""
    , wordSearchValue = ""
    , newWordValue = ""
    , searchDialogOpen = False
    , newWordFieldActive = False
    , loginFormTopBlockOpen = False
    , entryTabIndex = 0
    , route = route
    , mdl = Material.model
    , snackbar = Snackbar.model
    , newEntry = newEntryModelInit
    , shareDialog = initShareDialog
    , pageTitle = ""
    , pageNumber = 1
    , loadMoreState = EntriesNotAsked
    , appLanguage = language
    }
