// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from './application'

import DialogController from './dialog_controller.js'

import ElementController from './element_controller'

import FlashController from './flash_controller.js'

import FormController from './form_controller.js'

import LoaderController from './loader_controller.js'

import MediaSessionController from './media_session_controller.js'

import MiniPlayerController from './mini_player_controller.js'

import PlayerController from './player_controller.js'

import PlaylistSongsController from './playlist_songs_controller.js'

import PlaylistSortableController from './playlist_sortable_controller.js'

import SearchController from './search_controller.js'

import NativeBridgeController from './native_bridge_controller.js'

application.register('dialog', DialogController)

application.register('element', ElementController)

application.register('flash', FlashController)

application.register('form', FormController)

application.register('loader', LoaderController)

application.register('media-session', MediaSessionController)

application.register('mini-player', MiniPlayerController)

application.register('player', PlayerController)

application.register('playlist-songs', PlaylistSongsController)

application.register('playlist-sortable', PlaylistSortableController)

application.register('search', SearchController)

application.register('native-bridge', NativeBridgeController)
