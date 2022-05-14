import QtQuick
import QtQuick.Controls

Rectangle {
    id: resizableRec
    property int maxWidth: 200
    property int minWidth: 50
    property int maxHeight: 200
    property int minHeight: 50
    property int bw: 10
    MouseArea {
        id: resizingWindow
        anchors.fill: parent
        anchors.margins: resizableRec.bw
        hoverEnabled: true
        drag{
            target: parent
            minimumX: 0
            minimumY: 0
            maximumX: parent.parent.width - parent.width
            maximumY: parent.parent.height - parent.height
            smoothed: false
            filterChildren: true
        }
        onEntered: {
            cursorShape = Qt.SizeAllCursor
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
        }
        Component.onCompleted: {
            console.log("resizingWindow x:",x,"y:",y,"width:",width,"height:",height)
        }
    }
    MouseArea {
        id: topEdge
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.top
        height: resizableRec.bw
        cursorShape: Qt.SizeVerCursor
        preventStealing: true
        onMouseYChanged: {
//                console.log( "top area mouseY:",mouseY,"height:",resizableRec.height,"y",resizableRec.y)
            if((resizableRec.height - mouseY) > resizableRec.maxHeight){
                resizableRec.y = resizableRec.y - (resizableRec.maxHeight - resizableRec.height)
                resizableRec.height = resizableRec.maxHeight
            }else if((resizableRec.height - mouseY) < resizableRec.minHeight){
                resizableRec.y = resizableRec.y + (resizableRec.height - resizableRec.minHeight)
                resizableRec.height = resizableRec.minHeight
            }else{
                resizableRec.y = resizableRec.y + mouseY
                resizableRec.height = resizableRec.height - mouseY
            }
        }
    }
    MouseArea {
        id: bottomEdge
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.bottom
        height: resizableRec.bw
        cursorShape: Qt.SizeVerCursor
        preventStealing: true
        onMouseYChanged: {
//                console.log("bottom area mouseY:",mouseY,"height:",resizableRec.height,"y",resizableRec.y)
            if((resizableRec.height + mouseY) > resizableRec.maxHeight){
                resizableRec.height = resizableRec.maxHeight
            }else if((resizableRec.height + mouseY) < resizableRec.minHeight){
                resizableRec.height = resizableRec.minHeight
            }else{
                resizableRec.height = resizableRec.height + mouseY
            }
        }
    }
    MouseArea {
        id: leftEdge
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.left
        width: resizableRec.bw
        cursorShape: Qt.SizeHorCursor
        preventStealing: true
        onMouseXChanged: {
//                console.log("left area mouseX:",mouseX,"width:",resizableRec.width,"x:",resizableRec.x)
            if((resizableRec.width - mouseX) > resizableRec.maxWidth){
                resizableRec.x = resizableRec.x - (resizableRec.maxWidth - resizableRec.width)
                resizableRec.width = resizableRec.maxWidth
            }else if((resizableRec.width - mouseX) < resizableRec.minWidth){
                resizableRec.x = resizableRec.x + (resizableRec.width - resizableRec.minWidth)
                resizableRec.width = resizableRec.minWidth
            }else{
                resizableRec.x = resizableRec.x + mouseX
                resizableRec.width = resizableRec.width - mouseX
            }
        }
    }
    MouseArea {
        id: rightEdge
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.right
        width: resizableRec.bw
        cursorShape: Qt.SizeHorCursor
        preventStealing: true
        onMouseXChanged: {
//                console.log("right area mouseX:",mouseX,"width:",resizableRec.width,"x",resizableRec.x)
            if((resizableRec.width + mouseX) > resizableRec.maxWidth){
                resizableRec.width = resizableRec.maxWidth
            }else if((resizableRec.width + mouseX) < resizableRec.minWidth){
                resizableRec.width = resizableRec.minWidth
            }else{
                resizableRec.width = resizableRec.width + mouseX
            }
        }
    }
    MouseArea {
        id: leftTopEdge
        anchors.horizontalCenter: parent.left
        anchors.verticalCenter: parent.top
        width: resizableRec.bw
        height: resizableRec.bw
        cursorShape: Qt.SizeFDiagCursor
        preventStealing: true
        onMouseXChanged: {
//                console.log("left area mouseX:",mouseX,"width:",resizableRec.width,"x:",resizableRec.x)
            if((resizableRec.width - mouseX) > resizableRec.maxWidth){
                resizableRec.x = resizableRec.x - (resizableRec.maxWidth - resizableRec.width)
                resizableRec.width = resizableRec.maxWidth
            }else if((resizableRec.width - mouseX) < resizableRec.minWidth){
                resizableRec.x = resizableRec.x + (resizableRec.width - resizableRec.minWidth)
                resizableRec.width = resizableRec.minWidth
            }else{
                resizableRec.x = resizableRec.x + mouseX
                resizableRec.width = resizableRec.width - mouseX
            }
        }
        onMouseYChanged: {
//                console.log( "top area mouseY:",mouseY,"height:",resizableRec.height,"y",resizableRec.y)
            if((resizableRec.height - mouseY) > resizableRec.maxHeight){
                resizableRec.y = resizableRec.y - (resizableRec.maxHeight - resizableRec.height)
                resizableRec.height = resizableRec.maxHeight
            }else if((resizableRec.height - mouseY) < resizableRec.minHeight){
                resizableRec.y = resizableRec.y + (resizableRec.height - resizableRec.minHeight)
                resizableRec.height = resizableRec.minHeight
            }else{
                resizableRec.y = resizableRec.y + mouseY
                resizableRec.height = resizableRec.height - mouseY
            }
        }
    }
    MouseArea {
        id: rightTopEdge
        anchors.horizontalCenter: parent.right
        anchors.verticalCenter: parent.top
        width: resizableRec.bw
        height: resizableRec.bw
        cursorShape: Qt.SizeBDiagCursor
        preventStealing: true
        onMouseXChanged: {
//                console.log("right area mouseX:",mouseX,"width:",resizableRec.width,"x",resizableRec.x)
            if((resizableRec.width + mouseX) > resizableRec.maxWidth){
                resizableRec.width = resizableRec.maxWidth
            }else if((resizableRec.width + mouseX) < resizableRec.minWidth){
                resizableRec.width = resizableRec.minWidth
            }else{
                resizableRec.width = resizableRec.width + mouseX
            }
        }

        onMouseYChanged: {
//                console.log( "top area mouseY:",mouseY,"height:",resizableRec.height,"y",resizableRec.y)
            if((resizableRec.height - mouseY) > resizableRec.maxHeight){
                resizableRec.y = resizableRec.y - (resizableRec.maxHeight - resizableRec.height)
                resizableRec.height = resizableRec.maxHeight
            }else if((resizableRec.height - mouseY) < resizableRec.minHeight){
                resizableRec.y = resizableRec.y + (resizableRec.height - resizableRec.minHeight)
                resizableRec.height = resizableRec.minHeight
            }else{
                resizableRec.y = resizableRec.y + mouseY
                resizableRec.height = resizableRec.height - mouseY
            }
        }
    }
    MouseArea {
        id: rightBottomEdge
        anchors.horizontalCenter: parent.right
        anchors.verticalCenter: parent.bottom
        width: resizableRec.bw
        height: resizableRec.bw
        cursorShape: Qt.SizeFDiagCursor
        preventStealing: true
        onMouseXChanged: {
//                console.log("right area mouseX:",mouseX,"width:",resizableRec.width,"x",resizableRec.x)
            if((resizableRec.width + mouseX) > resizableRec.maxWidth){
                resizableRec.width = resizableRec.maxWidth
            }else if((resizableRec.width + mouseX) < resizableRec.minWidth){
                resizableRec.width = resizableRec.minWidth
            }else{
                resizableRec.width = resizableRec.width + mouseX
            }
        }
        onMouseYChanged: {
//                console.log("bottom area mouseY:",mouseY,"height:",resizableRec.height,"y",resizableRec.y)
            if((resizableRec.height + mouseY) > resizableRec.maxHeight){
                resizableRec.height = resizableRec.maxHeight
            }else if((resizableRec.height + mouseY) < resizableRec.minHeight){
                resizableRec.height = resizableRec.minHeight
            }else{
                resizableRec.height = resizableRec.height + mouseY
            }
        }
    }
    MouseArea {
        id: leftBottomEdge
        anchors.horizontalCenter: parent.left
        anchors.verticalCenter: parent.bottom
        width: resizableRec.bw
        height: resizableRec.bw
        cursorShape: Qt.SizeBDiagCursor
        preventStealing: true
        onMouseXChanged: {
//                console.log("left area mouseX:",mouseX,"width:",resizableRec.width,"x:",resizableRec.x)
            if((resizableRec.width - mouseX) > resizableRec.maxWidth){
                resizableRec.x = resizableRec.x - (resizableRec.maxWidth - resizableRec.width)
                resizableRec.width = resizableRec.maxWidth
            }else if((resizableRec.width - mouseX) < resizableRec.minWidth){
                resizableRec.x = resizableRec.x + (resizableRec.width - resizableRec.minWidth)
                resizableRec.width = resizableRec.minWidth
            }else{
                resizableRec.x = resizableRec.x + mouseX
                resizableRec.width = resizableRec.width - mouseX
            }
        }
        onMouseYChanged: {
//                console.log("bottom area mouseY:",mouseY,"height:",resizableRec.height,"y",resizableRec.y)
            if((resizableRec.height + mouseY) > resizableRec.maxHeight){
                resizableRec.height = resizableRec.maxHeight
            }else if((resizableRec.height + mouseY) < resizableRec.minHeight){
                resizableRec.height = resizableRec.minHeight
            }else{
                resizableRec.height = resizableRec.height + mouseY
            }
        }
    }
}
