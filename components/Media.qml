import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick.Layouts
import ".." as App

Rectangle {
    id: root

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

    property bool isVisible: {
        if (player == null)
            return false;

        if (player.trackTitle == null)
            return false;

        return true;
    }

    implicitHeight: App.Theme.barHeight - App.Theme.barPadding
    implicitWidth: layout.implicitWidth + App.Theme.componentsSpacing

    visible: isVisible
    color: App.Theme.mediaBackground
    radius: App.Theme.areaRadius

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

        Rectangle {
            implicitHeight: App.Theme.barHeight - App.Theme.barMarginTop
            implicitWidth: App.Theme.iconWidth
            color: "transparent"

            BarIcon {
                anchors.centerIn: parent
                text: root.statusIcon
            }
        }
    }

    Component.onCompleted: {
        console.log(`Identity: ${player.identity}`);
        console.log(`Entry: ${player.desktopEntry}`);
        console.log(`Entry: ${player.iconPath}`);
    }
}
