var cnt = 0;
var size = [
    {
        "left": "-90px",
        "width": "90px",
        "height": "100px",
        "z-index": "1",
        "top": "160px"
    },
    {
        "left": "0px",
        "width": "161px",
        "height": "212px",
        "z-index": "1",
        "top": "112px"
    },
    {
        "left": "105px",
        "width": "230px",
        "height": "302px",
        "z-index": "2",
        "top": "67px"
    }, {
        "left": "234px",
        "width": "305px",
        "height": "400px",
        "z-index": "3",
        "top": "15px"
    },
    {
        "left": "479px",
        "width": "230px",
        "height": "302px",
        "z-index": "2",
        "top": "67px"
    },
{
    "left": "653px",
    "width": "161px",
    "height": "212px",
    "z-index": "1",
    "top": "112px"
},
{
    "left": "890px",
    "width": "90px",
    "height": "100px",
    "z-index": "1",
    "top": "160px"
}
];
window.onload = function () {
    //초기 위치 설정
    for (var i = 0; i < $(".item").length; i++) {
        if (i + 3 < size.length) {
            $(".item").eq(i).css({
                left: size[i + 3]["left"],
                top: size[i + 3]["top"],
                width: size[i + 3]["width"],
                height: size[i + 3]["height"],
                zIndex: size[i + 3]["z-index"]
            });
        }
        else {
            $(".item").eq(i).css({
                left: size[6]["left"],
                top: size[6]["top"],
                width: size[6]["width"],
                height: size[6]["height"],
                zIndex: size[6]["z-index"]
            });
        }

    }

    $("#lpointer").click(function () {
        if (cnt < $(".item").length -1) {

            cnt++;
            //alert(cnt);
            for (var i = 0; i < $(".item").length; i++) {
                var num = 3 + (i - cnt);
                if (num < 1) {
                    $(".item").eq(i).animate({
                        left: size[0]["left"],
                        top: size[0]["top"],
                        width: size[0]["width"],
                        height: size[0]["height"],
                        zIndex: size[0]["z-index"]
                    });
                }
                else if (num > 5) {
                    $(".item").eq(i).animate({
                        left: size[6]["left"],
                        top: size[6]["top"],
                        width: size[6]["width"],
                        height: size[6]["height"],
                        zIndex: size[6]["z-index"]
                    });
                }
                else {
                    $(".item").eq(i).animate({
                        left: size[num]["left"],
                        top: size[num]["top"],
                        width: size[num]["width"],
                        height: size[num]["height"],
                        zIndex: size[num]["z-index"]
                    });
                }
            }
        }
    });

    $("#rpointer").click(function () {
        if (cnt > 0) {

            cnt--;
            //alert(cnt);
            for (var i = 0; i < $(".item").length; i++) {
                var num = 3 + (i - cnt);
                if (num < 1) {
                    $(".item").eq(i).animate({
                        left: size[0]["left"],
                        top: size[0]["top"],
                        width: size[0]["width"],
                        height: size[0]["height"],
                        zIndex: size[0]["z-index"]
                    });
                }
                else if (num > 5) {
                    $(".item").eq(i).animate({
                        left: size[6]["left"],
                        top: size[6]["top"],
                        width: size[6]["width"],
                        height: size[6]["height"],
                        zIndex: size[6]["z-index"]
                    });
                }
                else {
                    $(".item").eq(i).animate({
                        left: size[num]["left"],
                        top: size[num]["top"],
                        width: size[num]["width"],
                        height: size[num]["height"],
                        zIndex: size[num]["z-index"]
                    });
                }
            }
        }
    });
}
