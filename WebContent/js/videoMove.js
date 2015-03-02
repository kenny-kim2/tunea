var videolist;
var btnlist;
var point = 0;
window.onload = function () {
    videolist = document.querySelector(".video-list");
    btnlist = document.querySelectorAll(".video-btn");

    btnlist[0].style.border = "5px solid #000000";
    videolist.style.left = "0px";

    btnlist[0].addEventListener("click", function () {
        changeBorder(0);
        animateTo(videolist, 'left', 0, 1000, aa);
        
    });
    btnlist[1].addEventListener("click", function () {
        changeBorder(1);
        animateTo(videolist, 'left', -1080, 1000, aa);
        
    });
    btnlist[2].addEventListener("click", function () {
        changeBorder(2);
        animateTo(videolist, 'left', -2160, 1000, aa);
        
    });

    //btnlist[0].addEventListener("mouseover", function () {
    //    btnlist[0].style.border = "5px solid #000000";
    //});
    //btnlist[1].addEventListener("mouseover", function () {
    //    btnlist[1].style.border = "5px solid #000000";
    //});
    //btnlist[2].addEventListener("mouseover", function () {
    //    btnlist[2].style.border = "5px solid #000000";
    //});
}

function changeBorder(i) {
    for (var j = 0; j < btnlist.length; j++)
        btnlist[j].style.border = "5px solid #3bdfe4";

    btnlist[i].style.border = "5px solid #000000";
}
function animateTo(target, property, to, duration, easing) {
    //if (target.style[property] == "")
    //    if (property == "opacity")
    //        target.style[property] = form;
    //    else
    //        target.style[property] = from + "px";


    var from = parseInt(target.style[property]);
    var to = parseInt(to);

    var start = new Date();

    var id = setInterval(
            function () {
                var timePassed = new Date() - start;
                var progress = timePassed / duration;
                var result = "";

                if (progress > 1)
                    progress = 1;

                if (easing)
                    result = (from + (to - from) * easing(progress));
                else
                    result = (from + (to - from) * progress);

                if (property != "opacity")
                    result += "px";

                target.style[property] = result;
                if (progress == 1)
                    clearInterval(id);
            }, 10);

}

function linear(progress) {
    return progress;
}
function bb(progress) {
    return -1 * Math.pow(progress - 1, 2) + 1;
}
function aa(progress) {
    return Math.pow(progress, 2);
}