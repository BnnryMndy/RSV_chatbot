function displayQuestion(data, task_id) {
    console.log(data);
    getAwnsersList(task_id);
    $(".interective-helper__chat-room").append('<div class="interective-helper__question">' + data + '</div>');
    $(".interective-helper__chat-room").append('interective-helper__chat-line');
}

function displayAwnser(data) {
    $(".chat-log").append("<input class='interective-helper__answer' type='button' value='" + data + "'>");
}

function addReactions(data, reaction_data) {
    $('input[value="' + data + '"]').bind("click", function() {
        reaction(reaction_data);
        $(".interective-helper__answer").unbind();
        $(this).attr('class', "interective-helper__selected-answer");
        $(".interective-helper__answer").remove();
    });
}



function reaction(reaction_data) {
    console.log(reaction_data)
    var reaction_splitted_data = reaction_data.split(':');
    var reaction_type = reaction_splitted_data[0];
    var reaction_link = reaction_splitted_data[1];

    if (reaction_type == "next_task") {
        getQuestion(reaction_link);
    }
    if (reaction_type == "link") {
        window.location.replace(reaction_link);
    }
    if (reaction_type == "script") {
        getScript(reaction_link);
    }
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
            console.log(tasks);
            getQuestion(tasks[0]);
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
            selectReaction(awnser_id, data);
        }
    });
}

function selectReaction(awnser_id, button_data) {
    var request = $.ajax({
        type: "GET",
        url: "php/selectReactions.php",
        data: { awnser_id: awnser_id },
        success: function(data) {
            getReaction(data, button_data);
        }
    });
}



function getReaction(reaction_id, button_data) {
    console.log("reaction_id in getReaction  " + reaction_id);
    var request = $.ajax({
        type: "GET",
        url: "php/getReaction.php",
        data: { reaction_id: reaction_id },
        success: function(data) {
            addReactions(button_data, data);
        }
    });
}

$(document).ready(function() {
    getScript(4);
});