window.onload = function() {
    Hide();
}

window.addEventListener('message', (event) => {

    console.log(event.data.action);
    if (event.data.action === 'open') {
        ActiveReading(event.data.text);
    }

    if (event.data.action === 'edit') {
        ActiveEditing();
    }
});

function ActiveEditing() {
    $("#p1").show();
    $("#tearOut").show();
    $("#m").attr("readonly", false);
    $("#m").val("");
}

function ActiveReading(text) {
    $("#p1").show();
    $("#tearOut").hide();
    $("#m").attr("readonly", true);
    $("#m").val(text);
}

function tearout() {
    Hide();

    var ctx = $("#m").val();
    $.post("https://pbnotepad/action", JSON.stringify({action:"createNote", content:ctx}));
}


function Hide() {
    $("#p1").hide();
    $.post("https://pbnotepad/action", JSON.stringify({action:"hide"}));
}