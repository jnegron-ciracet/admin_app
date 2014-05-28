window.onload = function () {
    document.getElementById('hidden_chrt1Width').value = document.getElementById('chrt1').offsetWidth;
    document.getElementById('hidden_chrt2Width').value = document.getElementById('chrt2').offsetWidth;
    document.getElementById('hidden_chrt3Width').value = document.getElementById('chrt3').offsetWidth;
    document.getElementById('hidden_chrt4Width').value = document.getElementById('chrt4').offsetWidth;
    document.getElementById('hidden_chrt5Width').value = document.getElementById('chrt5').offsetWidth;
    __doPostBack("UpdatePanel2", "");
}

window.addEventListener('resize', go);
function go() {
    setTimeout(function () {
        document.getElementById('hidden_chrt1Width').value = document.getElementById('chrt1').offsetWidth;
        document.getElementById('hidden_chrt2Width').value = document.getElementById('chrt2').offsetWidth;
        document.getElementById('hidden_chrt3Width').value = document.getElementById('chrt3').offsetWidth;
        document.getElementById('hidden_chrt4Width').value = document.getElementById('chrt4').offsetWidth;
        document.getElementById('hidden_chrt5Width').value = document.getElementById('chrt5').offsetWidth;
        __doPostBack("UpdatePanel2", "");
    }, 800);
    
}