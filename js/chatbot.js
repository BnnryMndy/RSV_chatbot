function displayQuestion(data, task_id) {
    console.log(data);
    getAwnsersList(task_id);
    $(".chat-log").append("<h3>" + data + "</h3><br>");
}

function displayAwnser(data) {
    $(".chat-log").append("<input type='button' value='" + data + "'>");
}

function getQuestion(task_id) {
    console.log(task_id);
    var request = $.ajax({
        type: "GET",
        url: "php/getTask.php",
        data: { task_id: task_id },
        success: function(data) {
            displayQuestion(data, task_id);
        }
    });
}


function getAwnsersList(task_id) {
    var request = $.ajax({
        type: "GET",
        url: "php/selectAwnsers.php",
        data: { question_id: task_id },
        success: function(data) {
            awnsers = data.split(',');
            awnsers.forEach(awnser_id => {
                getAwnser(awnser_id);
            });
        }
    });
}

function getScript(script_id) {
    console.log(script_id);
    var request = $.ajax({
        type: "GET",
        url: "php/selectTasks.php",
        data: { script_id: script_id },
        success: function(data) {
            tasks = data.split(',');
            tasks.forEach(task_id => {
                getQuestion(task_id);
            });

        }
    });
}

function getAwnser(awnser_id) {
    var request = $.ajax({
        type: "GET",
        url: "php/getAwnser.php",
        data: { awnser_id: awnser_id },
        success: function(data) {
            displayAwnser(data);
            // getReactions(reaction_id);
        }
    });
}

function getReactions(reaction_id) {

}

$(document).ready(function() {
    getScript(4);

});