function addAwnser(event) {
    var awnser = document.createElement("div");
    awnser.innerHTML = '<fieldset class="awnser" id=""> <legend> Добавление ответа </legend><input placeholder = "Тип реакции" name = "ReactionType" list = "ReactionType"><input placeholder = "реакция" name = "reaction" type = "text"><input type="text" name="awnser" placeholder="ответ"></fieldset>';
    this.before(awnser);
}

function addHandler() {
    $('.add-awnser').on("click", addAwnser);
}

$(document).ready(function() {

    addHandler();
    // $('.add-awnser').on("click", addAwnser);
    $('#add-question').on("click", function(event) {
        var question = document.createElement("div");
        question.innerHTML = '<fieldset class="task" id="' + '"><legend>Создание нового вопроса</legend><input type="text" name="question" placeholder="Вопрос"> <fieldset class="awnser" id=""> <legend> Добавление ответа </legend><input placeholder = "Тип реакции" name = "ReactionType" list = "ReactionType"><input placeholder = "реакция" name = "reaction" type = "text"><input type="text" name="awnser" placeholder="ответ"></fieldset> <input class="add-awnser" type="button" value="+ ответ"></fieldset>';
        this.before(question);
        addHandler();
    });

});