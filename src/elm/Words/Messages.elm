module Words.Messages exposing (..)

import Entries.Models exposing (Entry, EntryId)
import Http exposing (Error)
import Material
import Material.Snackbar as Snackbar
import RemoteData exposing (WebData)
import Votes.Messages as VotesMsgs
import Words.Models exposing (..)


type Msg
    = NoOp
      -- Fetch entry words
    | EntryWordsResponse (WebData WordsResponse)
    | EntryVotedWordsResponse (WebData EntryVotedWords)
    | ShowMoreWords
      -- Vote for word
    | VoteForWord WordId EntryId
      -- Add new word
    | AddNewWord String EntryId
    | AddNewWordData (Result Error Word)
      -- Update fields value
    | UpdateWordSearchField String
    | ClearWordsSearchValue
    | UpdateNewWordValue String
    | UpdateShareDialogValues Entry String
    | SelectMenuItem String
    | SetElevation Bool
    | ShowTopLoginForm
    | VotesMsg VotesMsgs.Msg
    | Snackbar (Snackbar.Msg Int)
    | MDL (Material.Msg Msg)
