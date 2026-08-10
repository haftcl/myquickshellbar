import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick.Layouts
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)
    visible: isVisible
    color: App.Theme.mediaBackground

    readonly property var player: {
        let players = Mpris.players.values;

        let spotify = players.find(p => p.identity === "Spotify");
        if (spotify && spotify.playbackState === MprisPlaybackState.Playing)
            return spotify;

        let other_player_playing = players.find(p => p.playbackState === MprisPlaybackState.Playing);

        if (other_player_playing)
            return other_player_playing;

        if (spotify)
            return spotify;

        return players[0];
    }

    property string statusIcon: {
        switch (player?.playbackState) {
        case MprisPlaybackState.Playing:
            return App.Theme.playIcon;
        case MprisPlaybackState.Paused:
            return App.Theme.pauseIcon;
        default:
            return App.Theme.stopIcon;
        }
    }

    function isPlaying() {
        return player?.playbackState === MprisPlaybackState.Playing;
    }

    function isSpotify() {
        return player?.identity === 'Spotify';
    }

    property bool isVisible: {
        if (player == null)
            return false;

        if (player.trackTitle == null || player.trackTitle == "")
            return false;

        return true;
    }

    RowLayout {
        id: layout
        spacing: App.Theme.iconSpacing
        anchors.centerIn: parent

        IconImage {
            source: Quickshell.iconPath(player?.desktopEntry ? player.desktopEntry : 'audio-x-generic')
            implicitSize: App.Theme.iconWidth - App.Theme.iconSpacing
        }

        BarText {
            Layout.maximumWidth: App.Theme.mediaMaxWidth
            text: `${player?.trackTitle} - ${player?.trackArtist}`
            font.bold: true
            elide: Text.ElideMiddle
            wrapMode: Text.NoWrap
        }

        BarIcon {
            text: root.statusIcon
            font.pixelSize: App.Theme.fontSize
            visible: !root.isSpotify() || !root.isPlaying()
        }

        Equalizer {
            playing: root.isPlaying()
            visible: root.isSpotify() && root.isPlaying()
            barColor: App.Theme.equalizerColor
        }
    }
}
